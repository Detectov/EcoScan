defmodule EcoApi.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @derive {Jason.Encoder, only: [:id, :email, :inserted_at, :updated_at]}
  schema "users" do
    field(:email, :string)
    field(:password_hash, :string)
    # Campo virtual para la contraseña en texto plano
    field(:password, :string, virtual: true)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    # Cambio aquí: castear :password en lugar de :password_hash
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    # Validación sobre el campo virtual :password
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        hash = Bcrypt.hash_pwd_salt(password)
        put_change(changeset, :password_hash, hash)

      _ ->
        changeset
    end
  end
end
