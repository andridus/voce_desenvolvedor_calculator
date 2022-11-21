defmodule UI.Button do
  use Surface.Component

  prop label, :string, required: :true
  prop operation, :event, required: :true

  def render(assigns) do
    ~F"""
      <div class="btn btn-primary" :on-click={@operation}>{@label}</div>
    """
  end
end
