local files,folders = file.Find("gamemodes/ghosthunt/gamemode/*","MOD")

for i = 1, #folders do

	local folder = folders[i]

	local files,folders = file.Find("gamemodes/ghosthunt/gamemode/"..folder.."/*","MOD")

	for i = 1, #files do
		local file = files[i]
		AddCSLuaFile(folder.."/"..files[i])
		include(folder.."/"..files[i])
	end

end

for i = 1, #files do
	AddCSLuaFile(files[i])
end
