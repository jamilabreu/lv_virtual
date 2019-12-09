defmodule VirtualLvWeb.PageController do
  use VirtualLvWeb, :controller
  import Ecto.Query, warn: false
  alias VirtualLv.Posts.Post
  alias VirtualLv.Repo

  def index(conn, _params) do
    posts_with_virtual =
      Repo.all(
        from(
          p in Post,
          select: %{
            id: p.id,
            virtual: true
          }
        )
      )

    posts_without_virtual =
      Repo.all(
        from(
          p in Post,
          select: %{
            id: p.id,
            virtual: false
          }
        )
      )

    posts = posts_with_virtual ++ posts_without_virtual

    render(conn, "index.html", posts: posts)
  end
end
