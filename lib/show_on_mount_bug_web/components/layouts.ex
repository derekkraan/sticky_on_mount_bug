defmodule ShowOnMountBugWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use ShowOnMountBugWeb, :controller` and
  `use ShowOnMountBugWeb, :live_view`.
  """
  use ShowOnMountBugWeb, :html

  embed_templates "layouts/*"
end
