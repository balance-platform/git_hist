defmodule GitHistTest do
  use ExUnit.Case
  doctest GitHist

  use GitHist, filter_by_regex: ~r/Initial/

  defmodule Poem do
    use GitHist, file: "./test/little_poem.txt"
  end

  defmodule PoemFirst do
    use GitHist, file: "./test/little_poem.txt", filter_by_regex: ~r/First/
  end

  test "GitHistTest#commit_history" do
    assert ["28f111b349d4bf70971918e36d1ba7f334414dae Initial" | _tail] =
             GitHistTest.commit_history()
  end

  test "PoemFirst#commit_history" do
    assert ["2b21c4e32321b83a51a277508f75b1c1c0c6fe85 First row"] == PoemFirst.commit_history()
  end

  test "Poem#commit_history" do
    assert ["2b21c4e32321b83a51a277508f75b1c1c0c6fe85 First row" | _tail] = Poem.commit_history()
  end
end
