defmodule OberanWeb.PrivacyControllerTest do
  use OberanWeb.ConnCase

  test "GET /privacy", %{conn: conn} do
    conn = get(conn, ~p"/privacy")

    assert html_response(conn, 200) =~ "Privacy"
  end
end
