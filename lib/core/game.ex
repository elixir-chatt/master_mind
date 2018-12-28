defmodule MasterMind.Core.Game do
  defstruct answer: [1, 2, 3, 4], guesses: []
  def new(answer) do
    %__MODULE__{ answer: answer }
  end
  
  def score_reds(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.filter( fn({x, y}) -> x == y end)
    |> length
  end
  
  def misses(answer, guess) do
    (guess -- answer)
    |> length
  end
  
  def score_whites(answer, guess) do
    length(answer) - score_reds(answer, guess) - misses(answer, guess)
  end
  
  def add_guess(%__MODULE__{}=game, guess) do
    %__MODULE__{ game | guesses: [guess|game.guesses]}
  end
  
end