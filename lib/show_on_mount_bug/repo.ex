defmodule ShowOnMountBug.Repo do
  use Ecto.Repo,
    otp_app: :show_on_mount_bug,
    adapter: Ecto.Adapters.Postgres
end
