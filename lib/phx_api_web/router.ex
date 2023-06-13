defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router
  use Plug.ErrorHandler

  def handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  def handle_errors(conn, %{reason: %{message: message}}) do
    conn
    |> json(%{errors: message})
    |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts", AccountController, :create
    post "/accounts/sign_in", AccountController, :sign_in
  end
end
