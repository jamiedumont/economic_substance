defmodule EcoSubWeb.PageController do
  use EcoSubWeb, :controller
  alias EcoSubWeb.Router.Helpers, as: Routes
  alias EcoSub.Accounts
  alias EcoSub.Accounts.User

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def entity(conn, _params) do
    render(conn, "entity.html")
  end


  def view_terms(conn, _params) do
    user = conn.assigns[:current_user]
    render(conn, "terms.html", user: user)
  end

  def agree_to_terms(conn, %{"checked" => agreed}) do
    require IEx; IEx.pry()
    if agreed do
      %User{} = user = conn.assigns[:current_user]
      {:ok, user} = Accounts.agree_to_terms(user, %{terms_agreed_at: DateTime.utc_now()})
      user_return_to = get_session(conn, :user_return_to)
      IEx.pry()
      conn
      |> assign(:current_user, user)
      |> put_flash(:info, "Agreed to terms")
      |> redirect(to: user_return_to || "/")

    else
      conn
      |> redirect(to: Routes.page_path(conn, :view_terms))
    end

  end
end
