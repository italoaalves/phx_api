defmodule PhxApiWeb.AccountJSON do
  alias PhxApi.Accounts.Account
  alias PhxApi.Users.User

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account, user: user}) do
    %{data: data(account, user)}
  end

  def account_token(%{account: account, token: token}) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email,
    }
  end

  defp data(%Account{} = account, %User{} = user) do
    %{
      id: account.id,
      email: account.email,
      full_name: user.full_name,
      gender: user.gender,
      biography: user.biography
    }
  end
end
