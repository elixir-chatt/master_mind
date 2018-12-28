defmodule GameTest do
  use ExUnit.Case
  alias MasterMind.Core.Game
  
  test "should score reds" do
    assert Game.score_reds(answer(), [1, 2, 3, 6]) == 3
    assert Game.score_reds(answer(), [5, 5, 6, 6]) == 0
  end
  
  test "should score whites" do
    assert Game.score_whites(answer(), [4, 1, 6, 2]) == 3
    assert Game.score_whites(answer(), [4, 1, 3, 2]) == 3
    assert Game.score_whites(answer(), [1, 2, 3, 4]) == 0
    assert Game.score_whites(answer(), [5, 6, 5, 6]) == 0
  end
  
  def answer(), do: [1, 2, 3, 4]
end
