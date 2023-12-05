defmodule OberanWeb.SitemapController do
  use OberanWeb, :controller

  def home(conn, _params) do
    xml = OberanWeb.SitemapHTML.home(%{})

    conn
    |> put_resp_content_type("text/xml")
    |> text(xml)
  end
end
