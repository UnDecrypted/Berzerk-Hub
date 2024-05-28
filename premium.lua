local Premium = {
  10000000
}

for i, v in pairs(Premium) do
  if game.Players.LocalPlayer.UserId == v then
    return true
  end
  return false
end
