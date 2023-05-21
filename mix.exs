defmodule IsoLang.MixProject do
  use Mix.Project

  @source_url "https://github.com/luoken/iso_lang"
  @version "0.3.1"

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
      ],
      docs: [
        main: "readme",
        source_ref: "v#{@version}",
        source_url: @source_url,
        extras: extras()
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
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.29", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.16", only: [:dev, :test], runtime: false},
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

  def extras do
    [
      "README.md",
      "cheatsheet.cheatmd",
      "CHANGELOG.md"
    ]
  end
end
