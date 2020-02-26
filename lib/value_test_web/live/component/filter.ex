defmodule ValueTestWeb.Live.Component.Filter do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
      <div id="<%= @id %>">
        <div>
          <%= @query %>
          <form phx-submit="query" phx-target="#<%= @id %>">
            <input name="query" type="text" placeholder="Filter" autofocus="true" value="<%= @query %>"></input>
            <button type="submit">Filter</button>
          </form>
        </div>
      </div>
    """
  end

  def handle_event("query", query, socket) do
    send(self(), query)
    {:noreply, socket}
  end
end
