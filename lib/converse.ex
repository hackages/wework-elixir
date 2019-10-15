defmodule Robot.Converse do
  @moduledoc """
  This module contains the functions that allow Marvin to converse with us
  """

  @greetings [
    "Hello friend!",
    "Good day, sir.",
    "Oh... hello! I didn't see you there."
  ]

  def say(something) do
    IO.puts("#{something}\n")
  end

  def shout(something) do
    something
    |> String.upcase()
    |> (fn x -> "#{x}!!!" end).()
    |> IO.puts()
  end

  def greet() do
    Enum.random(@greetings)
    |> say()
  end
end
