defmodule MathsTest do
  use ExUnit.Case

  alias Robot.Maths

  test "split_bill" do
    IO.puts("test split_bill")
    assert Maths.split_bill([32, 43, 57], 21, 12, 4) === 44.72
    assert Maths.split_bill([43, 56, 78, 98, 34], 15, 10, 5) === 78.17
    assert Maths.split_bill([72, 43, 78, 89, 64], 10, 20, 5) === 91.34
  end
end
