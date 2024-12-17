defmodule ShowOnMountBugWeb.MyLive do
  use ShowOnMountBugWeb, :live_view

  alias ShowOnMountBugWeb.MyChildLive

  def mount(params, session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    {@user.name}
    """
  end
end
