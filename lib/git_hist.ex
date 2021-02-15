defmodule GitHist do
  @moduledoc """
  Documentation for `GitHist`.

  This library helps to get file history (Mostly in couple with task-tracker)

  For example, I have an Api and want to show tasks history for users

  ```
  defmodule FooApi do
    use GitHist, filter_by_regex: ~r/JIRA-\d?/

    ...
  end
  ```

  After this module has new method: commit_history

  ```
  FooApi.commit_history() # =>
  [
    "JIRA-1 Initial of Foo API",
    "JIRA-13 Bugfix of method bar",
    ...
    "JIRA-245 New method added - zar"
  ]
  ```
  """

  defmacro __using__(opts) do
    quote do
      def commit_history do
        params = unquote(opts)
        filter_by_regex = Keyword.get(params, :filter_by_regex, ~r/.*/)
        file = Keyword.get(params, :file, __ENV__.file)
        commits = GitHist.Git.file_commit_history(file)

        {:ok, commits} = commits
        Enum.filter(commits, &String.match?(&1, filter_by_regex))
      end
    end
  end
end
