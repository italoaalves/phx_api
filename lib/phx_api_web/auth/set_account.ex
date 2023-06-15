defmodule PhxApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias PhxApiWeb.Auth.ErrorResponse
  alias PhxApi.Accounts

  def init(_options) do

  end
  def call(conn, _options) do
    if conn.assigns[:account] do
      conn
    else
      assign_account(conn)
    end
  end

  defp assign_account(conn) do
    account_id = get_session(conn, :account_id)

    if account_id == nil, do: raise ErrorResponse.Unauthorized

    account = Accounts.get_account!(account_id)

    cond do
      account_id && account -> assign(conn, :account, account)
      true -> assign(conn, :account, nil)
    end
  end
end
