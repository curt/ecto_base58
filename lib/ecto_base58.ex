defmodule EctoBase58 do
  use Ecto.Type

  def type, do: :uuid

  def cast(base58_id) when is_binary(base58_id) do
    decode!(base58_id)
  rescue
    _ -> :error
  else
    _ -> {:ok, base58_id}
  end

  def cast(_), do: :error

  def dump(base58_id) do
    decode!(base58_id)
  rescue
    _ -> :error
  else
    id -> {:ok, id}
  end

  def load(<<_::128>> = binary_id) do
    {:ok, encode(binary_id)}
  end

  def load(_), do: :error

  def generate() do
    encode(Ecto.UUID.bingenerate())
  end

  def autogenerate, do: generate()

  defp decode!(base58_id) do
    Base58Check.decode58!(base58_id)
    |> maybe_pad_with_bytes()
  end

  defp maybe_pad_with_bytes(decoded) do
    missing_bytes = 16 - byte_size(decoded)
    if missing_bytes > 0 do
      Enum.reduce(1..missing_bytes, decoded, fn _x, acc -> << 0 >> <> acc end)
    else
      decoded
    end
  end

  defp encode(binary_id) do
    Base58Check.encode58(binary_id)
  end
end
