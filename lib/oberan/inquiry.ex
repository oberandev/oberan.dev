defmodule Oberan.Inquiry do
  @moduledoc """
  Schemaless struct for validating a user inquiry
  """
  import Ecto.Changeset

  @types %{
    name: :string,
    email: :string,
    company: :string,
    phone: :string,
    message: :string,
    budget: :string
  }

  defstruct [
    :name,
    :email,
    :company,
    :phone,
    :message,
    :budget
  ]

  @doc false
  def changeset(%__MODULE__{} = inquiry, attrs \\ %{}) do
    {inquiry, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:name, :email, :message, :budget])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:message, min: 10)
  end
end
