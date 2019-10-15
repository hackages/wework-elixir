defmodule Robot.Conversations.SplitBill do
  def split_bill() do
    prices =
      IO.gets("What are the prices of the items you ordered\n")
      |> String.trim()
      |> String.downcase()
      |> String.split(" ")
      |> Enum.map(fn price -> String.to_integer(price) end)

    vat =
      IO.gets("What is the VAT rate in the country you're in?\n")
      |> String.trim()
      |> String.to_integer()

    tip =
      IO.gets("Which percentage do you want to give as a tip?\n")
      |> String.trim()
      |> String.to_integer()

    friends =
      IO.gets("How many of you humans were eating there?\n")
      |> String.trim()
      |> String.to_integer()

    prices
    |> Robot.Maths.split_bill(vat, tip, friends)
    |> (fn total -> Robot.Converse.say("You'll each have to pay #{total}") end).()
  end
end
