defmodule OberanWeb.ContactControllerTest do
  use OberanWeb.ConnCase

  import Swoosh.TestAssertions

  test "GET /contact", %{conn: conn} do
    conn = get(conn, ~p"/contact")

    assert html_response(conn, 200) =~ "Contact Us"
  end

  describe "POST /contact" do
    test "successfully submits an inquiry", %{conn: conn} do
      inquiry = %{
        "name" => "John Doe",
        "email" => "john.doe@company.com",
        "company" => "Uptown Dynamics, Inc.",
        "phone" => "+1 303-555-0101",
        "message" => "asdfasdfasdfasdfasdfasdf",
        "budget" => "25"
      }

      conn =
        conn
        |> post(~p"/contact", inquiry)

      assert redirected_to(conn) == ~p"/"
      assert %{"info" => "Thank you! Your inquiry has been sent successfully."} = conn.assigns.flash

      assert_email_sent(Obearn.InquiryEmail.internal(inquiry))
      assert_email_sent(Obearn.InquiryEmail.thank_you(inquiry))
    end

    test "renders form errors for missing data", %{conn: conn} do
      inquiry = %{
        "name" => "John Doe",
        "email" => "",
        "company" => "",
        "phone" => "",
        "message" => "",
        "budget" => ""
      }

      conn =
        conn
        |> post(~p"/contact", inquiry)

      response = html_response(conn, 200)

      assert response =~ "Contact Us"
      assert response =~ "can&#39;t be blank"

      refute_email_sent()
    end
  end
end
