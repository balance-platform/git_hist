defmodule GitHist.GitTest do
  use ExUnit.Case
  doctest GitHist.Git
  alias GitHist.Git

  describe "file_commit_history" do
    test "ok: file exists" do
      assert {:ok, list} = Git.file_commit_history("./test/little_poem.txt")
      assert ["2b21c4e32321b83a51a277508f75b1c1c0c6fe85 First row" | _latest_commits] = list
    end

    test "ok: doesn't exist, empty result" do
      assert {:ok, []} = Git.file_commit_history("./test/unknown")
    end
  end
end
