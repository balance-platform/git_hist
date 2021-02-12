defmodule GitHist.MixProject do
  use Mix.Project

  def project do
    [
      app: :git_hist,
      version: "0.1.0",
      elixir: "~> 1.8",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      deps: deps(),
      source_url: "https://github.com/balance-platform/git_hist",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        plt_add_deps: :transitive
      ],
      # Docs
      name: "git_hist",
      source_url: "https://github.com/balance-platform/git_hist",
      homepage_url: "https://github.com/balance-platform/git_hist",
      docs: [
        main: "git_hist",
        extras: ["README.md"]
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
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12.2", only: :test},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Git integrated tool that helps to get file commit history"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "git_hist",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/balance-platform/git_hist"}
    ]
  end
end
