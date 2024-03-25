defmodule StroblWeb.PhoenixController do
  use StroblWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :phoenix, layout: false)
  end
end
