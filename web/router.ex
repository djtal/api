defmodule Peepchat.Router do
  use Peepchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]

    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Peepchat do
    pipe_through :api
    post "register", RegistrationController, :create
    post "token", SessionController, :create, as: :login
    get "/user/current", UserController, :curent
  end
end
