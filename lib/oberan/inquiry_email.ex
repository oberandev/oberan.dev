defmodule Obearn.InquiryEmail do
  import Swoosh.Email

  def internal(form) do
    new()
    |> to({"Oberan", "hello@oberan.dev"})
    |> from({"Oberan", "noreply@oberan.dev"})
    |> subject("Inquiry")
    |> text_body("""
    Name: #{Map.get(form, "name")}\n
    Email: #{Map.get(form, "email")}\n
    Company: #{Map.get(form, "company")}\n
    Phone: #{Map.get(form, "phone")}\n
    Message: #{Map.get(form, "message")}\n
    Budget: #{case Map.get(form, "budget") do
      "25" -> "$25K – $50K"
      "50" -> "$50K – $100K"
      "100" -> "$100K – $150K"
      "150" -> "More than $150K"
    end}
    """)
  end

  def thank_you(form) do
    new()
    |> to({Map.get(form, "name"), Map.get(form, "email")})
    |> from({"Oberan", "noreply@oberan.dev"})
    |> subject("Thank You")
    |> text_body(
      "We have received your inquriy and will be in touch shortly.\n\nCheers,\nThe Oberan team"
    )
  end
end
