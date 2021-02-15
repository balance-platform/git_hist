defmodule GitHist.Git do
  @moduledoc false


  def file_commit_history(filepath) when is_binary(filepath) do
    case System.cmd("git", [
           "log",
           "--pretty=oneline",
           "--author-date-order",
           "--date-order",
           "--",
           filepath
         ]) do
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
