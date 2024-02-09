defmodule EcoApiWeb.Router do
  use EcoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, scheme: "Bearer", module: EcoApi.Guardian
    plug Guardian.Plug.LoadResource, ensure: true, module: EcoApi.Guardian
  end

  scope "/api", EcoApiWeb do
    pipe_through :api

    post "/users", UserController, :create
    post "/login", SessionController, :create
  end

  scope "/api", EcoApiWeb do
    # Usa el pipeline de autenticación aquí
    pipe_through [:api, :api_auth]

    get "/hello", DefaultController, :index
  end
end
