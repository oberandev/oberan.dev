defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  alias Oberan.Inquiry
  alias Obearn.InquiryEmail
  alias Oberan.Mailer

  def new(conn, _params) do
    changeset =
      %Inquiry{}
      |> Inquiry.changeset()

    conn
    |> assign(:page_title, "Contact")
    |> assign(:changeset, changeset)
    |> render(:new)
  end

  def create(conn, inquiry_params) do
    changeset =
      %Inquiry{}
      |> Inquiry.changeset(inquiry_params)
      |> Map.put(:action, :insert)

    if changeset.valid? do
      InquiryEmail.thank_you(inquiry_params)
      |> Mailer.deliver()

      InquiryEmail.internal(inquiry_params)
      |> Mailer.deliver()

      conn
      |> put_flash(:info, "Thank you! Your inquiry has been sent successfully.")
      |> redirect(to: ~p"/")
    else
      conn
      |> assign(:page_title, "Contact")
      |> assign(:changeset, changeset)
      |> render(:new)
    end
  end
end
