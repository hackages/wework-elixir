defmodule Robot.Maths do
  def add(x, y) do
    x + y
  end

  #   2. `substract(x, y)`: substracts y from x
  def substract(x, y) do
    x - y
  end

  # 3. `multiply(x, y)`: a with b
  def multiply(x, y) do
    x * y
  end

  def double(x) do
    multiply(x, 2)
  end

  def divide(_, 0) do
    # Cannot divide by zero
    IO.puts("Cannot divide by zero")
  end

  def divide(x, y) do
    x / y
  end

  def add_percentage(amount, percentage) do
    amount + amount * percentage / 100
  end

  def split_bill(items, vat, tip, friends) do
    items
    |> Enum.sum()
    |> add_percentage(vat)
    |> add_percentage(tip)
    |> divide(friends)
    |> Float.floor(2)
  end
end