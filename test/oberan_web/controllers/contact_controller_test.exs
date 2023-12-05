defmodule OberanWeb.ContactControllerTest do
  use OberanWeb.ConnCase

  test "GET /contact", %{conn: conn} do
    conn = get(conn, ~p"/contact")

    assert html_response(conn, 200) =~ "Contact Us"
  end

  describe "POST /contact" do
    test "successful submits an inquiry", %{conn: conn} do
      conn =
        post(conn, ~p"/contact", %{
          "name" => "John Doe",
          "email" => "john.doe@company.com",
          "company" => "Uptown Dynamics, Inc.",
          "phone" => "+1 303-555-0101",
          "message" => "asdfasdfasdfasdfasdfasdf",
          "budget" => "25"
        })

      assert redirected_to(conn) == ~p"/"
      assert %{"info" => "Thank you! Your inquiry has been sent successfully."} = conn.assigns.flash
    end

    test "renders form errors for missing data", %{conn: conn} do
      conn =
        post(conn, ~p"/contact", %{
          "name" => "John Doe",
          "email" => "",
          "company" => "",
          "phone" => "",
          "message" => "",
          "budget" => ""
        })

      response = html_response(conn, 200)

      assert response =~ "Contact Us"
      assert response =~ "can&#39;t be blank"
    end
  end
end
