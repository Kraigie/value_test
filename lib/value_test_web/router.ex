defmodule ValueTestWeb.Router do
  use ValueTestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ValueTestWeb do
    pipe_through :browser

    live "/", FormLiveView
  end

  # Other scopes may use custom stacks.
  # scope "/api", ValueTestWeb do
  #   pipe_through :api
  # end
end
