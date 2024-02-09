defmodule EcoApiWeb.SessionController do
  use EcoApiWeb, :controller
  alias EcoApi.Auth
  alias EcoApi.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)

        conn
        |> put_status(:ok)
        |> json(%{jwt: token})

      _error ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid credentials"})
    end
  end
end
