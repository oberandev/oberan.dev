defmodule OberanWeb.ContactController do
  use OberanWeb, :controller

  alias Oberan.Inquiry

  def new(conn, _params) do
    changeset =
      %Inquiry{}
      |> Oberan.Inquiry.changeset()

    conn
    |> assign(:page_title, "Contact")
    |> assign(:changeset, changeset)
    |> render(:new)
  end

  # def create(conn, %{"inquiry" => inquiry_params}) do
  def create(conn, inquiry_params) do
    changeset =
      %Inquiry{}
      |> Oberan.Inquiry.changeset(inquiry_params)
      |> Map.put(:action, :insert)

    IO.inspect(changeset)

    if changeset.valid? do
      conn
      |> put_flash(:info, "Inquiry sent successfully.")
      |> redirect(to: ~p"/")
    else
      conn
      |> assign(:changeset, changeset)
      |> render(:new)
    end
  end
end
