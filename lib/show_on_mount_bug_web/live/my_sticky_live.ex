defmodule ShowOnMountBugWeb.MyStickyLive do
  use ShowOnMountBugWeb, :live_view

  alias ShowOnMountBugWeb.UserMounter
  # on_mount {UserMounter, :mount}

  def mount(params, session, socket) do
    if connected?(socket) do
      IO.inspect("CONNECTED")
      {:ok, socket, layout: false}
    else
      IO.inspect("NOT CONNECTED")

      {:ok, socket |> assign_new(:user, fn -> %{name: "Severus Snape"} end), layout: false}
      |> IO.inspect()
    end
  end

  def render(assigns) do
    ~H"""
    {@user.name}
    """
  end
end
