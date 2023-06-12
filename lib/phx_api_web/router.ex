defmodule PhxApiWeb.Router do
  use PhxApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
