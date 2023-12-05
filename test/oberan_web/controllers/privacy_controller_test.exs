defmodule OberanWeb.PrivacyControllerTest do
  use OberanWeb.ConnCase

  test "GET /privacy", %{conn: conn} do
    conn = get(conn, ~p"/privacy")

    response = html_response(conn, 200)

    assert response =~ "Privacy Notice"
    assert response =~ ~p"/privacy#toc"
  end
end
