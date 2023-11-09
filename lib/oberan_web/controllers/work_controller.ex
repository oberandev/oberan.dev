defmodule OberanWeb.WorkController do
  use OberanWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Our Work")
    |> render(:home)
  end
end
