defmodule EcoApi.Guardian do
  use Guardian, otp_app: :eco_api

  def subject_for_token(user, _claims) do
    # Usa el `id` del usuario para el subject del token
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    # Encuentra el usuario por `id` almacenado en el subject del token
    id = claims["sub"]
    # Asegúrate de implementar esta función según tu contexto de autenticación
    user = EcoApi.Auth.get_user!(id)
    {:ok, user}
  end
end
