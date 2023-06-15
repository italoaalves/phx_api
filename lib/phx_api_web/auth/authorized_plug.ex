defmodule PhxApiWeb.Auth.AuthorizedPlug do
  alias PhxApiWeb.Auth.ErrorResponse

  def is_authorized(%{params: %{"account" => params}} = conn, _options) do
    if conn.assigns.account.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden, message: "You don't have rights to do that"
    end
  end

  def is_authorized(%{params: %{"user" => params}} = conn, _options) do
    if conn.assigns.account.user.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden, message: "You don't have rights to do that"
    end
  end
end
