defmodule GoldBook.Router do
  use GoldBook.Web, :router

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

  scope "/", GoldBook do
    pipe_through :browser # Use the default browser stack

    get   "/",        PageController, :index
    post  "/new",     PageController, :new
    post  "/destroy", PageController, :destroy
  end

  # Other scopes may use custom stacks.
  # scope "/api", GoldBook do
  #   pipe_through :api
  # end
end
