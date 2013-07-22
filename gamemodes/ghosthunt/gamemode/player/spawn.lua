function GM:PlayerSpawn(player)

	GAMEMODE:SetPlayerSpeed(player,190,320)

	player:SetModel("models/player/group03/male_0"..math.random(1,9)..".mdl")
	player:SetCanZoom(false)

	player:Give("weapon_physcannon")

end
