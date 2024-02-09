defmodule EcoApiWeb.DefaultController do
  use EcoApiWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello world")
  end
end
