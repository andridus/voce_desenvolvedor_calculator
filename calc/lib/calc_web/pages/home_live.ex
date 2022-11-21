defmodule CalcWeb.Pages.HomeLive do
  use Surface.LiveView

  alias Calc.{Buttons, Core}

  data result, :number, default: 0
  data history, :list, default: []

  def render(assigns) do
    ~F"""
      <UI.Container>
        <UI.Calc>
          <UI.Input value={@history}/>
          <UI.Result value={@result}/>
          <UI.OptionalButtons />
          <UI.Grid cols="4" gap="2">
            {#for {label, action} <- Buttons.all()}
              <UI.Button label={label} operation={action}/>
            {/for}
          </UI.Grid>
        </UI.Calc>
      </UI.Container>
    """
  end

  def handle_event(op, _, socket) do
    assigns = socket.assigns
    history = assigns.history
    state = {history, 0}
    {history, result} = Core.add_operation(state, op)

    socket = assign(socket, history: history, result: result)
    {:noreply, socket }
  end
end
