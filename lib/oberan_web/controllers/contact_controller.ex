defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Contact")
    |> render(:home)
  end
end
