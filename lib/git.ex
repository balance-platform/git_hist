defmodule GitHist.Git do
  def file_commit_history(filepath) when is_binary(filepath) do
    case System.cmd("git", ["log", "--pretty=oneline", filepath]) do
      {logs_string, 0} ->
        logs =
          logs_string
          |> String.split("\n")
          |> Enum.reject(&(&1 == ""))
          |> Enum.reverse()

        {:ok, logs}

      {other, not_zero} ->
        {:error, inspect({other, not_zero})}
    end
  end
end