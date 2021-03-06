defmodule MemberSpace.Router do
  use MemberSpace.Web, :router

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

  scope "/", MemberSpace do
    pipe_through :browser # Use the default browser stack

    # Get routes
    get   "/",                PageController,   :index
    get   "/register",        PageController,   :register
    get   "/login",           PageController,   :login
    get   "/logout",          PageController,   :logout
    get   "/mlist",           PageController,   :mlist
    get   "/mlist/:id",       PageController,   :member

    # Post routes
    post  "/new",             PageController,   :new
    post  "/log",             SessionControl,   :log
    post  "/drop",            SessionControl,   :drop
    post  "/mlist/:id/edit",  PageController,   :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", MemberSpace do
  #   pipe_through :api
  # end
end
