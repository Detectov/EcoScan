defmodule EcoApiWeb.Router do
  use EcoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EcoApiWeb do
    pipe_through :api
  end
end
