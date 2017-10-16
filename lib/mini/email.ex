defmodule Mini.Email do
  use Bamboo.Phoenix, view: Mini.EmailView

  alias Mini.{User}

  def welcome_email(%User{email: email}) do
    new_email
    |> to(email)
    |> from("no-reply@mini.io")
    |> subject("Welcome")
    |> text_body("Welcome to Mini!")
  end
end
