defmodule Robot.Grok do
  @moduledoc """
  This module helps Marvin interpret the commands we ask him
  """
  @commands %{
    "quit" => "Puts me to sleep",
    "hello" => "Makes me greet you"
  }

  alias Robot.Converse
  alias Robot.Maths

  @doc """
  Grok is the function that tries to make sense of what we're saying to Marvin
  """
  def grok(["quit"]) do
    IO.puts("\nSee you later\n")
  end

  def grok(cmd) do
    case cmd do
      ["hello"] ->
        Converse.greet()

      ["repeat" | args] ->
        Enum.map(args, fn x -> Converse.say(x) end)

      ["shout" | args] ->
        Enum.map(args, fn x -> Converse.shout(x) end)

      ["add" | [x, y]] ->
        Maths.add(String.to_integer(x), String.to_integer(y))
        |> Converse.say()

      ["substract" | [x, y]] ->
        Maths.substract(String.to_integer(x), String.to_integer(y))
        |> Converse.say()

      ["multiply" | [x, y]] ->
        Maths.multiply(String.to_integer(x), String.to_integer(y))
        |> Converse.say()

      ["divide" | [x, y]] ->
        Maths.divide(String.to_integer(x), String.to_integer(y))
        |> Converse.say()

      ["double" | [x]] ->
        Maths.double(String.to_integer(x))
        |> Converse.say()

      ["calculate", "bill" | prices] ->
        prices
        |> Enum.map(fn x -> String.to_integer(x) end)
        |> Maths.calculate_bill()
        |> Converse.say()

      ["calculate", _] ->
        Converse.say("I'm sorry, I'm not sure what you want me to calculate")

      _ ->
        Converse.say(
          "I'm sorry, I didn't quite catch that. Here's a list of commands I do understand:"
        )

        @commands
        |> Enum.map(fn {command, description} -> "  #{command} - #{description}\n" end)
        |> Converse.say()
    end

    Robot.CLI.listen()
  end
end
