for _ <- 1..5 do
  VirtualLv.Repo.insert!(%VirtualLv.Posts.Post{})
end
