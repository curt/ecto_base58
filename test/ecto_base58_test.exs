defmodule EctoBase58Test do
  use ExUnit.Case, async: true

  @test_base58 "CsPJQ9ijAWf31b2fN4trm4"
  @test_base58_short "CsPJQ9ijAWf31b2f"
  @test_base58_invalid "O"
  @test_binary << 96, 29, 116, 228, 168, 211, 75, 110,
                       131, 101, 237, 219, 76, 137, 51, 39 >>
  @test_binary_short << 10, 216, 6, 83, 224, 219, 184, 167,
                        73, 36, 222, 200 >>


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
