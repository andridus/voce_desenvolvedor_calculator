defmodule UI.Input do
  use Surface.Component

  alias Calc.Buttons
  prop value, :list, required: true

  def render(assigns) do
    ~F"""
      <div class="p-2 h-16 flex items-start justify-end ">
        <div class="text-3xl">{parse(@value)}</div>
      </div>
    """
  end

  def parse(value) do
    Enum.map(value, &Buttons.parse_value/1)
    |> Enum.reverse()
  end
end
