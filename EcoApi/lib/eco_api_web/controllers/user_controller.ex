defmodule EcoApiWeb.UserController do
  use EcoApiWeb, :controller

  alias EcoApi.Auth

  def create(conn, %{"user" => user_params}) do
    case Auth.register_user(user_params) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> json(%{user: user})

      {:error, changeset} ->
        IO.inspect(changeset, label: "Failed changeset")

        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "Unable to create user."})
    end
  end
end
