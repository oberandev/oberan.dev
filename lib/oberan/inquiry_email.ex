defmodule Obearn.InquiryEmail do
  import Swoosh.Email

  def internal(form) do
    new()
    |> to({"Oberan", "hello@oberan.dev"})
    |> from({"Oberan", "hello@oberan.dev"})
    |> subject("New Inquiry!")
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
    |> from({"Oberan", "hello@oberan.dev"})
    |> subject("Thank You")
    |> text_body("""
    👋 Hello/Hola/Bonjour/Hallo,\n\n
    We have received your inquriy and will be in touch shortly.\n\n
    All the best,\n— The crew at Oberan"
    """)
  end
end
