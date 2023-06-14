defmodule PhxApiWeb.Auth.ErrorReponse.Unauthorized do
  defexception [message: "Unauthorized", plug_status: 401]
end

defmodule PhxApiWeb.Auth.ErrorReponse.Forbidden do
  defexception [message: "Forbidden", plug_status: 403]
end
