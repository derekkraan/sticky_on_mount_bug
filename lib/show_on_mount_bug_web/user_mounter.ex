defmodule ShowOnMountBugWeb.UserMounter do
  def on_mount(:mount, _params, _session, socket) do
    dbg()
    IO.inspect(__MODULE__, label: "GOT HERE")

    {:cont,
     socket
     |> Phoenix.Component.assign_new(:user, fn -> %{name: "Derek Kraan"} end)}
  end
end
