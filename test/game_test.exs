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
  
  test "should determine winner for single score" do
    losing_score = %{ red: 3, white: 0}
    refute Game.win?(losing_score)
    winning_score = %{ red: 4, white: 0}
    assert Game.win?(winning_score)
  end
  
  test "should score game" do
    assert Game.game_won?(winning_game())  
  end
  
  test "i tried" do
    assert Game.game_lost?(losing_game())  
  end
  
  
  def winning_game() do
    answer()
    |> Game.new
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([1, 2, 3, 4])
  end
  
  def losing_game() do
    answer()
    |> Game.new
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
    |> Game.add_guess([4, 3, 2, 1])
  end
  
  
  def answer(), do: [1, 2, 3, 4]
end
