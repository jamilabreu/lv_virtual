defmodule VirtualLvWeb.Router do
  use VirtualLvWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VirtualLvWeb do
    pipe_through :browser

    get "/", PageController, :index
    # live "/", TestLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", VirtualLvWeb do
  #   pipe_through :api
  # end
end
