defmodule ValueTestWeb.FormLiveView do
  use Phoenix.LiveView

  @test_data [
    %{id: 1, name: "dave"},
    %{id: 2, name: "aidan"},
    %{id: 3, name: "lee"}
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, test_data: @test_data, query: nil)}
  end

  @impl true
  def render(assigns) do
    ~L"""

      <%= live_component @socket, ValueTestWeb.Live.Component.Filter, query: @query, id: "data-search" %>

      <table>
      <thead>
        <tr>
          <th>Id</th>
          <th>Name</th>
        </tr>
      </thead>
      <tbody>
        <%= for data <- @test_data do %>
            <tr class="data">
              <td><%= data[:id] %></td>
              <td><%= data[:name] %></td>
            </tr>
        <% end %>
      </tbody>
    </table>
    """
  end

  @impl true
  def handle_info(%{"query" => q}, socket) do
    to_show = Enum.filter(@test_data, fn d -> d.name =~ q end)

    {:noreply, assign(socket, test_data: to_show, query: q)}
  end
end
