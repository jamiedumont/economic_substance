defmodule EcoSubWeb.UserSessionController do
  use EcoSubWeb, :controller

  alias EcoSub.Accounts
  alias EcoSubWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do

      conn
      |> put_session(:user_totp_pending, true)
      |> put_session(:user_id, user.id)
      |> redirect(to: Routes.user_totp_path(conn, :new))
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, "new.html", error_message: "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end

  def totp(conn, _params) do
    render(conn, "totp.html", error_message: nil)
  end

  def totp_submit(conn, %{} = params) do

  end
end
