defmodule MasterMind.Boundary.Game do
  alias MasterMind.Core.Game
  
  def init(answer) do
    {:ok, Game.new(answer)}
  end
  
  def start_link(answer) do
    {:ok, pid} = GenServer.start_link(__MODULE__, answer)
    pid
  end
  
  def state(pid) do
    GenServer.call pid, :state
  end
  
  def board(pid) do
    GenServer.call pid, :board
  end
  
  def guess(pid, guess) do
    GenServer.call pid, {:guess, guess}
  end
  
  def is_win(pid) do
    GenServer.call pid, :is_win
  end
  
  def handle_call(:is_win, _from, game) do
    {:reply, Game.game_won?(game), game}
  end
  
  def handle_call({:guess, guess}, _from, game) do
    new_game = Game.add_guess(game, guess)
    
    {:reply, :ok, new_game}
  end
  
  def handle_call(:scores, _from, game) do
    {:reply, Game.scores(game), game}
  end
  
  def handle_call(:board, _from, game) do
    {:reply, Game.board(game), game}
  end

  def handle_call(:state, _from, game) do
    {:reply, game, game}
  end
end