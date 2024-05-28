function load(premium)
  local Game = {
    {101010,"",""}
  }

  print(game.PlaceId)
  
  for i, v in pairs(Game) do
    if game.PlaceId == v[1] then
      if premium then
        loadstring(game:HttpGet(v[3]))()
        SendNotif("Success To Load Script : "..game.name)
      else
        loadstring(game:HttpGet(v[2]))()
        SendNotif("Success To Load Script : "..game.name)
      end
      Loaded = true
      return
    end
  end
end
