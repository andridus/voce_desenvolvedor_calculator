defmodule UI.Result do
  use Surface.Component

  prop value, :number, required: true

  def render(assigns) do
    ~F"""
      <div class="p-2 h-16 flex items-end justify-end">
        <div class="text-3xl text-gray-400">{@value}</div>
      </div>
    """
  end

end
