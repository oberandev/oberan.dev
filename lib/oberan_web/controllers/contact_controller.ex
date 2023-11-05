defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
