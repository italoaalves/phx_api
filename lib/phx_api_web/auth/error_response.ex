defmodule PhxApiWeb.Auth.ErrorResponse.Unauthorized do
  defexception [message: "Unauthorized", plug_status: 401]
end

defmodule PhxApiWeb.Auth.ErrorResponse.Forbidden do
  defexception [message: "Forbidden", plug_status: 403]
end
