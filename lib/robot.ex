defmodule Robot.CLI do
  @moduledoc """
  This module groups all the CLI related functionality for our robot
  """
  alias Robot.Converse

  def main(_args) do
    Converse.greet()
    listen()
  end

  def listen do
    IO.gets("\n> ")
    |> String.trim()
    |> String.downcase()
    |> Converse.grok()
  end
end
