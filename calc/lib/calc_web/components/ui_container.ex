defmodule UI.Container do
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class="container mx-auto bg-gray-300 min-h-screen flex items-center justify-center">
      <#slot />
    </div>
    """
  end
end
