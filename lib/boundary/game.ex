defmodule MasterMind.Boundary.Game do
  alias MasterMind.Core.Game
  
  def init(answer) do
    {:ok, Game.new(answer)}
  end
  
  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.add_guess(game, guess)
    
    {:reply, :ok, new_game}
  end
  
  def handle_call(:scores, _from, game) do
    {:reply, Game.scores(game), game}
  end
  
  def handle_call(:state, _from, game) do
    {:reply, Game.board(game), game}
  end
end