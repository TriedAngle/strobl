defmodule StroblWeb.HomeController do
  use StroblWeb, :controller

  def index(conn, _params) do
    render(conn, :home)
  end
end
