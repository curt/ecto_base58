defmodule EctoBase58.MixProject do
  use Mix.Project

  def project do
    [
      app: :ecto_base58,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.6"},
      {:base_58_check, git: "https://github.com/curt/base58check.git", ref: "d36bab06b05af0c65b7663e7f4d905b0e9cef526"}
    ]
  end
end
