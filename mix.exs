defmodule IsoLang.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :iso_lang,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      description: "Formalizes interface for ISO-639 language codes and assists with conversion",
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env()),
      elixirc_options: [
        warnings_as_errors: true
      ],
      test_coverage: [
        tool: ExCoveralls
      ],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        credo: :test,
        lint: :test,
        "local.hex": :prod,
        "local.rebar": :prod,
        "deps.get": :prod,
        test_reset: :test
      ]
    ]
  end

  defp aliases do
    [
      lint: ["format --check-formatted", "credo --strict"]
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
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.28", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14", only: [:dev, :test], runtime: false},
      {:gettext, ">= 0.19.1"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      maintainers: ["Everett Griffiths", "Ken Luo"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/luoken/iso_lang"}
    ]
  end
end
