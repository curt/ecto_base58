# ecto_base58

The `ecto_base58` package provides the `EctoBase58` module,
which defines a custom `Ecto.Type` that makes shorter, friendlier
Base58-encoded identifiers visible to the user, while mapping to the commonly used
`UUID` identifiers in the database.

The `ecto_base58` relies on the `base_58_check` package to provide the
Base58 conversion, using the same alphabet used by Bitcoin identifiers.

## Installation

The package can be installed by adding `ecto_base58` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ecto_base58, git: "https://github.com/curt/ecto_base58.git"}
  ]
end
```

## Roadmap

The package still needs to be uploaded to https://hex.pm.

A few more tests would be nice.

## About

The package author and maintainer is [Curt Gilman](https://github.com/curt).
It was extracted from another project that has yet to be released.

It is licensed under the MIT License, for now at least.
