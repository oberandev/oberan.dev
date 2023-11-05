defmodule OberanWeb.ContactControllerTest do
  use OberanWeb.ConnCase

  test "GET /contact", %{conn: conn} do
    conn = get(conn, ~p"/contact")

    assert html_response(conn, 200) =~ "Contact Us"
  end
end
