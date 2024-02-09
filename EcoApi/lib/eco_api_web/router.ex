defmodule EcoApiWeb.Router do
  use EcoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EcoApiWeb do
    pipe_through :api

    post "/users", UserController, :create
    post "/login", SessionController, :create
    # Otros endpoints que no requieren autenticación previa
  end
end
