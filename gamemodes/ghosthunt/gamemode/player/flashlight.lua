function GM:PlayerSwitchFlashlight(player,booleanOn)

	if !player:Alive() then
		return
	end

	player:AllowFlashlight(false)

	player:EmitSoundTS("buttons/lightswitch2.wav",70,100)

	player.FlashlightData = player.FlashlightData or {}

	local data = player.FlashlightData

	-- setup toggling
	data.Toggled = data.Toggled or false
	data.Toggled = !data.Toggled

	--

	data.Entity = ents.Create("env_projectedtexture")

	if data.Toggled == true then

		local weapon = player:GetActiveWeapon()
		local vModel = player:GetViewModel()

		if weapon:IsValid() then
			data.Entity:SetParent(vModel)
			data.Entity:SetParentAttachment("eyes")
		else
			data.Entity:SetParent(player)
			data.Entity:SetParentAttachment("eyes")
		end

		data.Entity:SetLocalPos(Vector(0,0,12))
		data.Entity:SetLocalAngles(Angle(0,0,0))

		data.Entity:SetKeyValue("enableshadows",1)
		data.Entity:SetKeyValue("nearz",4)
		data.Entity:SetKeyValue("farz",1024)
		data.Entity:SetKeyValue("lightfov",50)

		data.Entity:SetKeyValue("lightcolor","255 255 255 255")

		data.Entity:SetOwner(player)
		data.Entity.IsFlashlight = true

		data.Entity:Spawn()

	end

	if data.Toggled == false then

		if data.Entity then

			for _,entity in pairs(ents.FindByClass("env_projectedtexture")) do
				if entity.IsFlashlight == true then
					if entity:GetOwner() == player then
						entity:Remove()
						entity = NULL
					end
				end
			end

		end

	end

end
