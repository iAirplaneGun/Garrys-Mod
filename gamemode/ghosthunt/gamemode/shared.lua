AddCSLuaFile("manager.lua")

AddCSLuaFile("shared.lua")
AddCSLuaFile("server.lua")

include("manager.lua")
include("server.lua")

GM.Name 		= "ghosthunt"
GM.Author 		= "SkepticDosh"
GM.Email 		= "--"
GM.Website 		= "--"

function GM:GetGameDescription()
	return self.Name
end

function message(string)
	MsgC(Color(255,255,0),"[ghosthunt]")
	MsgC(Color(255,255,255)," - "..string)
end

function GM:Initialize()
	message("Gamemode initialized\n")
end
