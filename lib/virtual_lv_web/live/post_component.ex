defmodule VirtualLvWeb.PostComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
      <div><%= @post.virtual %></div>
    """
  end

  def update(%{post: post}, socket) do
    {:ok, assign(socket, :post, post)}
  end
end
