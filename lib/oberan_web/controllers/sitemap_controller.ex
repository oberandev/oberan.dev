defmodule OberanWeb.SitemapController do
  use OberanWeb, :controller

  def index(conn, _params) do
    xml = OberanWeb.SitemapHTML.index(%{})

    conn
    |> put_resp_content_type("text/xml")
    |> text(xml)
  end
end
