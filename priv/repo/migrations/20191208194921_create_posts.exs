defmodule VirtualLv.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :text, :string

      timestamps()
    end

  end
end
