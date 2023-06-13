defmodule PhxApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_api,
  module: PhxApiWeb.Auth.Guardian,
  error_handler: PhxApiWeb.Auth.GuardianErrorHandler

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
