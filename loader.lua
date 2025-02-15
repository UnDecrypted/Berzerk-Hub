local Game = {
  {101010,""}
}

for i, v in pairs(Game) do
  if game.PlaceId == v[1] then
    loadstring(game:HttpGet(v[2]))()
  end
end
