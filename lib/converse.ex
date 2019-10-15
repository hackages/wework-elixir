defmodule Robot.Converse do
  @moduledoc """
  This module contains the functions that allow Marvin to converse with us
  """

  @greeting "Hi friend! I am Marvin, your new robot"

  @doc """
  Grok is the function that tries to make sense of what we're saying to Marvin
  """
  def grok("quit") do
    IO.puts("\nSee you later\n")
  end

  def grok(_) do
    IO.puts(@greeting)
    Robot.CLI.listen()
  end

  def greet() do
    say(@greeting)
  end

  defp say(something) do
    IO.puts("#{something}\n")
  end
end
