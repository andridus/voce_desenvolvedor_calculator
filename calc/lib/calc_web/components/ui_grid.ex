defmodule UI.Grid do

  use Surface.Component

  slot default, required: true
  prop cols, :string, default: "1"
  prop gap, :string, default: "0"

  def render(assigns) do
    ~F"""
      <div class={"grid grid-cols-#{@cols} gap-#{@gap}"}>
        <#slot />
      </div>
    """
  end
end
