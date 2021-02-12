
# GitHist

[![hex.pm](https://img.shields.io/badge/docs-hexpm-blue.svg)](https://hexdocs.pm/git_hist)
[![hex.pm](https://img.shields.io/hexpm/v/git_hist.svg)](https://hex.pm/packages/git_hist)
[![hex.pm](https://img.shields.io/hexpm/dt/git_hist.svg)](https://hex.pm/packages/git_hist)
[![hex.pm](https://img.shields.io/hexpm/l/git_hist.svg)](https://hex.pm/packages/git_hist)
[![github.com](https://img.shields.io/github/last-commit/balance-platform/git_hist.svg)](https://github.com/balance-platform/git_hist/commits/master)
![Elixir CI](https://github.com/balance-platform/git_hist/workflows/Elixir%20CI/badge.svg)


  Documentation for `GitHist`.

  This library helps to get file history (Mostly in couple with task-tracker)

  For example, I have an Api and want to show tasks history for users

  ```elixir
  defmodule FooApi do
    use GitHist, filter_by_regex: ~r/JIRA-\d?/

    ...
  end
  ```

  After this module has new method: commit_history

  ```elixir
  FooApi.commit_history() # =>
  [
    "JIRA-1 Initial of Foo API",
    "JIRA-13 Bugfix of method bar",
    ...
    "JIRA-245 New method added - zar"
  ]


# Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `git_hist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:git_hist, "~> 0.1.0"}
  ]
end
```

