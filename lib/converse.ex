defmodule Robot.Converse do
  @moduledoc """
  This module contains the functions that allow Marvin to converse with us
  """

  @greetings [
    "Hello friend!",
    "Good day, sir.",
    "Oh... hello! I didn't see you there."
  ]

  @commands %{
    "quit" => "Puts me to sleep",
    "hello" => "Makes me greet you"
  }

  @doc """
  Grok is the function that tries to make sense of what we're saying to Marvin
  """
  def grok(["quit"]) do
    IO.puts("\nSee you later\n")
  end

  def grok(["hello"]) do
    greet()
    Robot.CLI.listen()
  end

  def grok(_) do
    say("I'm sorry, I didn't quite catch that. Here's a list of commands I do understand:")

    @commands
    |> Enum.map(fn {command, description} -> "  #{command} - #{description}\n" end)
    |> say()

    Robot.CLI.listen()
  end

  def greet() do
    Enum.random(@greetings)
    |> say()
  end

  defp say(something) do
    IO.puts("#{something}\n")
  end
end
