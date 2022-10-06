defmodule KinoVix.MixProject do
  use Mix.Project

  @url "https://github.com/maartenvanvliet/kino_vix"

  def project do
    [
      app: :kino_vix,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: @url,
      homepage_url: @url,
      name: "KinoVix",
      description: "Kino.Render protocol implementation for Vix.Vips.Image structs.",
      package: [
        maintainers: ["Maarten van Vliet"],
        licenses: ["MIT"],
        links: %{"GitHub" => @url},
        files: ~w(LICENSE README.md lib mix.exs .formatter.exs)
      ],
      docs: [
        source_url: @url,
        assets: "assets"
      ]
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
      {:kino, "~> 0.6.2"},
      {:vix, "~> 0.5"},
      {:ex_doc, "~> 0.28", only: :docs}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
