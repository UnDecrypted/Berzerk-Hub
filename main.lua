local Game = {
  {101010,"pbahs"}
}

for i, v in pairs(Game) do
  print(game.PlaceId)
  if game.PlaceId == v[1] then
    loadstring(game:HttpGet(v[2]))()
    SendNotif("Success To Load Script : "..game.name)
    Loaded = true
    return
  end
end
