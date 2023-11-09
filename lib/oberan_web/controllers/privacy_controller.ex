defmodule OberanWeb.PrivacyController do
  use OberanWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Privacy Notice")
    |> render(:home)
  end
end
