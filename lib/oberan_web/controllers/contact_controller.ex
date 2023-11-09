defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  def create(conn, _params) do
    conn
    |> assign(:page_title, "Contact")
    |> assign(:changeset, %{})
    |> render(:create)
  end
end
