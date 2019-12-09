defmodule VirtualLv.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :text, :string
    field :virtual, :boolean, virtual: true

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
