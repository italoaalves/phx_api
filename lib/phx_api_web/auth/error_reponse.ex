defmodule PhxApiWeb.Auth.ErrorReponse.Unauthorized do
  defexception [message: "Unauthorized", plug_status: 401]
end
