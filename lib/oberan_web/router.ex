defmodule OberanWeb.Router do
  use OberanWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {OberanWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", OberanWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/contact", ContactController, :new
    post "/contact", ContactController, :create
    get "/privacy", PrivacyController, :home
    get "/sitemap", SitemapController, :home
    get "/work", WorkController, :home
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:oberan, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: OberanWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
