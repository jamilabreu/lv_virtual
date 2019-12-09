defmodule VirtualLvWeb.TestLive do
  use Phoenix.LiveView
  import Ecto.Query, warn: false
  alias VirtualLv.Posts.Post
  alias VirtualLv.Repo

  def render(assigns) do
    ~L"""
      <%= for post <- @posts do %>
        <%= live_component @socket, VirtualLvWeb.PostComponent, id: post.id, post: post %>
      <% end %>
    """
  end

  def mount(%{posts: posts}, socket) do
    {:ok, assign(socket, :posts, posts)}
  end

  def mount(_session, socket) do
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

    {:ok, assign(socket, :posts, posts)}
  end
end
