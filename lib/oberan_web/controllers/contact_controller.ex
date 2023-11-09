defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Contact")
    |> assign(:form, %{})
    |> render(:home)
  end
end
