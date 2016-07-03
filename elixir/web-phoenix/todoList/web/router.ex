defmodule TodoList.Router do
  use TodoList.Web, :router

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

  scope "/", TodoList do
    pipe_through :browser # Use the default browser stack

    get   "/",            PageController, :index
    post  "/new",         PageController, :create
    post  "/switch/:id",  PageController, :switch
    post  "/destroy/:id", PageController, :destroy
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoList do
  #   pipe_through :api
  # end
end
