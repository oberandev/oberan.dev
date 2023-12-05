defmodule OberanWeb.WorkControllerTest do
  use OberanWeb.ConnCase

  test "GET /work", %{conn: conn} do
    conn = get(conn, ~p"/work")

    response = html_response(conn, 200)

    assert response =~ "Our Work"
  end
end
