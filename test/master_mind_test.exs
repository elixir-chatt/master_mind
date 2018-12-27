defmodule MasterMindTest do
  use ExUnit.Case
  doctest MasterMind

  test "greets the world" do
    assert MasterMind.hello() == :world
  end
end
