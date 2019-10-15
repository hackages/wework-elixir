defmodule ElixirIntroTest do
  use ExUnit.Case
  doctest ElixirIntro

  test "greets the world" do
    assert ElixirIntro.hello() == :world
  end
end
