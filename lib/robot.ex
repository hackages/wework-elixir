defmodule Robot.CLI do
  @moduledoc """
  This module groups all the CLI related functionality for our robot
  """

  def main(_args) do
    Robot.Converse.greet()
    listen()
  end

  def listen do
    IO.gets("> ")
    |> String.trim()
    |> String.downcase()
    |> String.split(" ")
    |> Robot.Grok.grok()
  end
end
