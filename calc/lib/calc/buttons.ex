defmodule Calc.Buttons do

  def all do
    [
      {"C", "clear"},
      {"()", "noop"},
      {"%", "percent"},
      {"/", "div"},
      {"7", "num_7"},
      {"8", "num_8"},
      {"9", "num_9"},
      {"*", "mult"},
      {"4", "num_4"},
      {"5", "num_5"},
      {"6", "num_6"},
      {"-", "minus"},
      {"1", "num_1"},
      {"2", "num_2"},
      {"3", "num_3"},
      {"+", "plus"},
      {"+/-", "invert"},
      {"0", "num_0"},
      {".", "dot"},
      {"=", "equal"}
    ]
  end
  def parse_value(value) do
    case value do
      "clear" -> "C"
      "percent" -> "%"
      "div" -> "/"
      "mult" -> "*"
      "minus" -> "-"
      "plus" -> "+"
      "invert" -> ""
      "dot" -> "."
      "equal" -> "="
      "num_9" -> "9"
      "num_8" -> "8"
      "num_7" -> "7"
      "num_6" -> "6"
      "num_5" -> "5"
      "num_4" -> "4"
      "num_3" -> "3"
      "num_2" -> "2"
      "num_1" -> "1"
      "num_0" -> "0"
    end
  end
end
