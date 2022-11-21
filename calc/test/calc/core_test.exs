defmodule Calc.CoreTest do
  use ExUnit.Case
  alias Calc.Core
  doctest Core

  test "sum two numbers" do
    assert 11 = Core.sum(5, 6)
  end

  test "subtract two numbers" do
    assert 1 = Core.sub(6, 5)
  end

  test "divide two numbers" do
    assert 5 = Core.div_(25,5)
  end

  test "multiply two numbers" do
    assert 25 = Core.mult(5,5)
  end

  test "result for operations" do
    state = {[], 0}
    assert {["num_1"], 1} = Core.add_operation(state, "num_1")
    assert {["plus", "num_1"], 1} =
        state
        |> Core.add_operation("num_1")
        |> Core.add_operation("plus")

    assert {["clear", "num_1"], 0} =
      state
      |> Core.add_operation("num_1")
      |> Core.add_operation("clear")

    assert {["num_2", "plus", "num_1"], 3} =
      state
      |> Core.add_operation("num_1")
      |> Core.add_operation("plus")
      |> Core.add_operation("num_2")

    assert {["num_1", "plus","num_2", "plus", "num_1"], 4} =
      state
      |> Core.add_operation("num_1")
      |> Core.add_operation("plus")
      |> Core.add_operation("num_2")
      |> Core.add_operation("plus")
      |> Core.add_operation("num_1")


    assert {["num_1", "plus","num_2", "plus", "num_1"], 4} =
      state
      |> Core.add_operation("num_1")
      |> Core.add_operation("plus")
      |> Core.add_operation("num_2")
      |> Core.add_operation("plus")
      |> Core.add_operation("num_1")

      assert {["num_1", "minus","num_1", "plus","num_2", "plus", "num_1"], 3} =
        state
        |> Core.add_operation("num_1")
        |> Core.add_operation("plus")
        |> Core.add_operation("num_2")
        |> Core.add_operation("plus")
        |> Core.add_operation("num_1")
        |> Core.add_operation("minus")
        |> Core.add_operation("num_1")

  end

end
