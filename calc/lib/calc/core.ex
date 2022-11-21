defmodule Calc.Core do

  def sum(a,b), do: a+b
  def sub(a,b), do: a-b
  def div_(a,b), do: Kernel.div(a,b)
  def mult(a,b), do: a*b


  def add_operation({history, _}, operation) do
    history = [operation | history]
    {history, parse_result(Enum.reverse(history))}
  end
  def parse_result([]), do: []

  def parse_result([num]) do
    value = parse_code(num)
    if is_atom(value) do
      0
    else
      value
    end
  end
  def parse_result([num, op]) do
    case {parse_code(num), parse_code(op)} do
      {_num, :clear} -> 0
      {num, :invert} -> -num
      {num, :equal} -> num
      {num, _op} -> num
    end
  end

  def parse_result([num, op, num2]) do
    case {parse_code(num), parse_code(op), parse_code(num2)} do
      {_num, :clear, _num2} -> 0
      {num, :invert, _num2} -> -num
      {num, :equal, _num2} -> num
      {num, :plus, num2} -> sum(num, num2)
      {num, :minus, num2} -> sub(num, num2)
      {num, :div, num2} -> div_(num, num2)
      {num, :mult, num2} -> mult(num, num2)
    end
  end
  def parse_result([num, op, num2 | history]) do
    [parse_result([num, op, num2]) | history]
    |> parse_result()
  end

  def parse_code(code) do
    case code do
      "clear" -> :clear
      "noop" ->  :noop
      "percent" -> :percent
      "div" -> :div
      "mult" -> :mult
      "minus" -> :minus
      "plus" -> :plus
      "invert" -> :invert
      "dot" -> :dot
      "equal" -> :equal
      "num_9" -> 9
      "num_8" -> 8
      "num_7" -> 7
      "num_6" -> 6
      "num_5" -> 5
      "num_4" -> 4
      "num_3" -> 3
      "num_2" -> 2
      "num_1" -> 1
      "num_0" -> 0
      num when is_number(num)-> num
    end
  end
end
