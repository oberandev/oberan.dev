defmodule OberanWeb.PrivacyController do
  use OberanWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
