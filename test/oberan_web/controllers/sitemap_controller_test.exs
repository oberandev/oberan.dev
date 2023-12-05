defmodule OberanWeb.SitemapControllerTest do
  use OberanWeb.ConnCase

  test "GET /sitemap", %{conn: conn} do
    conn = get(conn, ~p"/sitemap")

    response = response(conn, 200)

    assert response =~ ~p"/"
    assert response =~ ~p"/contact"
    assert response =~ ~p"/privacy"
  end
end
