defmodule OberanWeb.PrivacyController do
  use OberanWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Privacy")
    |> render(:home)
  end
end
