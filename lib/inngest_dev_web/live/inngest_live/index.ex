defmodule InngestDevWeb.InngestLive.Index do
  use InngestDevWeb, :live_view

  import InngestDevWeb.IconComponents

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(
        sdk_version: Inngest.Config.sdk_version(),
        functions: [],
        registered: false
      )

    socket = if connected?(socket), do: load_data(socket), else: socket

    {:ok, socket, layout: false}
  end

  defp load_data(socket) do
    case Inngest.Client.dev_info() do
      {:ok, %{"handlers" => nil, "functions" => nil} = _body} ->
        socket |> assign(registered: false)

      {:ok, %{"handlers" => _handlers, "functions" => _functions}} ->
        socket
        |> assign(
          # functions: functions |> Enum.map(&Inngest.Function.from/1),
          registered: true
        )

      {:error, _} ->
        socket |> assign(registered: false)
    end
  end
end
