defmodule PhxApiWeb.DefaultController do
  use PhxApiWeb, :controller

  def index(conn, _params) do
    text conn, "The API is LIVE. - #{Mix.env()}"
  end
end
