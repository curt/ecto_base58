defmodule EctoBase58Test do
  use ExUnit.Case, async: true

  @test_base58 "CsPJQ9ijAWf31b2fN4trm4"
  @test_base58_short "CsPJQ9ijAWf31b2f"
  @test_base58_zero "1"
  @test_base58_invalid "O"
  @test_binary <<96, 29, 116, 228, 168, 211, 75, 110, 131, 101, 237, 219, 76, 137, 51, 39>>
  @test_binary_short <<0, 0, 0, 0, 10, 216, 6, 83, 224, 219, 184, 167, 73, 36, 222, 200>>
  @test_binary_zero <<0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>>

  test "binaries" do
    assert is_binary(@test_binary)
    assert is_binary(@test_binary_short)
    assert byte_size(@test_binary) == 16
    assert byte_size(@test_binary_short) == 16
  end

  test "cast" do
    assert EctoBase58.cast(@test_base58) == {:ok, @test_base58}
    assert EctoBase58.cast(@test_base58_invalid) == :error
    assert EctoBase58.cast(nil) == :error
  end

  test "load" do
    assert EctoBase58.load(@test_binary) == {:ok, @test_base58}
    assert EctoBase58.load("") == :error
  end

  test "dump" do
    assert EctoBase58.dump(@test_base58) == {:ok, @test_binary}

    assert EctoBase58.dump(@test_base58_short) == {:ok, @test_binary_short}
    {:ok, dump_test_short} = EctoBase58.dump(@test_base58_short)
    assert is_binary(dump_test_short)
    assert byte_size(dump_test_short) == 16

    assert EctoBase58.dump(@test_base58_zero) == {:ok, @test_binary_zero}
    {:ok, dump_test_zero} = EctoBase58.dump(@test_base58_zero)
    assert is_binary(dump_test_zero)
    assert byte_size(dump_test_zero) == 16

    assert EctoBase58.dump(@test_base58_invalid) == :error
  end

  test "generate" do
    generated = EctoBase58.generate()
    assert generated
    assert is_binary(generated)
    assert String.length(generated) > 0
    assert String.length(generated) <= 22
  end
end
