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
  
  test "should count complete misses" do
	assert Game.misses(answer(), [5, 5, 5, 5]) == 4
	assert Game.misses(answer(), [1, 5, 5, 5]) == 3
	assert Game.misses(answer(), [5, 1, 5, 5]) == 3
	assert Game.misses(answer(), [1, 2, 3, 4]) == 0
	assert Game.misses(answer(), [4, 3, 2, 1]) == 0
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
  
  test "should return a game with 1 guess" do
	game = 
	  [1, 1, 1, 1] 
	  |> Game.new
	  |> Game.add_guess([5, 5, 5, 5])
	
	assert length(game.guesses) == 1
  end
  
  test "should return a game with 3 guesses" do
	game = 
	   Game.new([5, 5, 5, 5])
	|> Game.add_guess([1, 1, 1, 1])
	|> Game.add_guess([2, 2, 2, 2])
	|> Game.add_guess([3, 3, 3, 3])
	assert length(game.guesses) == 3
  end
  
  test "should fully score a single guess" do
	assert Game.score(answer(), [1, 5, 2, 5]) == %{red: 1, white: 1}
	assert Game.score(answer(), [1, 2, 3, 4]) == %{red: 4, white: 0}
	assert Game.score(answer(), [4, 3, 2, 1]) == %{red: 0, white: 4}
	refute Game.score(answer(), [5, 2, 2, 5]) == %{red: 2, white: 2} 
  end
  
 test "should tally the scores for all the guesses in a game" do
	assert Game.scores(winning_game()) == [%{red: 4, white: 0}, %{red: 0, white: 4}]
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
