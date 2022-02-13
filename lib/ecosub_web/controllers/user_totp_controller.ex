defmodule EcoSubWeb.UserTotpController do
  use EcoSubWeb, :controller

  alias EcoSub.Accounts
  alias EcoSubWeb.UserAuth

  @pending :user_totp_pending

  plug :redirect_if_totp_is_not_pending

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => %{"code" => code}}) do
    user =
      conn
      |> get_session(:user_id)
      |> Accounts.get_user!()

    case Accounts.validate_user_totp(user, code) do
      :valid_totp ->
        conn
        |> delete_session(@pending)
        |> UserAuth.log_in_user(user, %{})

      {:valid_backup_code, remaining} ->
        plural = ngettext("backup code", "backup codes", remaining)

        conn
        |> delete_session(@pending)
        |> put_flash(
          :info,
          "You have #{remaining} #{plural} left. " <>
            "You can generate new ones under the Two-factor authentication section in the Settings page"
        )
        |> UserAuth.log_in_user(user, %{})

      :invalid ->
        render(conn, "new.html", error_message: "Invalid two-factor authentication code")
    end
  end

  defp redirect_if_totp_is_not_pending(conn, _opts) do
    if get_session(conn, @pending) do
      conn
    else
      conn
      |> put_flash(:error, "Cannot authenticate with 2FA without first submitting valid password")
      |> redirect(to: Routes.user_session_path(conn, :new))
      |> halt()
    end
  end
end
