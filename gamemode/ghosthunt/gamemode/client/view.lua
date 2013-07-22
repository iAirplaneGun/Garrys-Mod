function GM:CalcView(player,origin,angles,fov,nearz,farz)

	local view	= {}

	view.origin = origin
	view.angles = angles
	view.fov	= fov
	view.nearz	= nearz
	view.farz	= farz

	if !player:IsValid() then
		return view
	end

	local boneIndex = player:LookupBone("ValveBiped.Bip01_Head1")

	if boneIndex != nil then

    	local bonePos,boneAng 	= player:GetBonePosition(boneIndex)

		view.origin = bonePos
		view.angles.p = view.angles.p + (boneAng.p * 0.125)

	end

	if !player:Alive() then

		local ragdoll = player:GetRagdollEntity()

		if !ragdoll then
			return
		end

		if ragdoll:IsValid() then

			view.origin = ragdoll:GetPos() + Vector(0,0,64)

			local boneIndex = ragdoll:LookupBone("ValveBiped.Bip01_Head1")

			if boneIndex != nil then

				local bonePos,boneAng = ragdoll:GetBonePosition(boneIndex)

				view.angles = (bonePos - view.origin):Angle()

			end

		end

	end

	--

	view.vm_origin,view.vm_angles = view.origin * 1,view.angles * 1

	local weapon = player:GetActiveWeapon()

	if weapon.Base != nil and weapon:IsValid() then

		if weapon.GetViewModelPosition then

			view.vm_origin,view.vm_angles = weapon:GetViewModelPosition(view.origin * 1,view.angles * 1)

		end

	end

	return view
end

function GM:CalcViewModelView(weapon,vModel,oldPos,oldAng,newPos,newAng)

	if !weapon:IsValid() then
		return
	end

	local player = weapon:GetOwner()

	local anim_attachment_rh 	= player:LookupAttachment("anim_attachment_rh")
	local attachment 			= player:GetAttachment(anim_attachment_rh)

	local handPos,handAng		= attachment.Pos,attachment.Ang

	local vecOffset = handAng:Up() * 15 + handAng:Right() * 1.5 + handAng:Forward() * 5
	local angOffset = Angle(0,0,0)

	oldPos = handPos + vecOffset
	--oldAng = handAng + angOffset

	local vecDifference = (oldPos - newPos) * 0.1250
	--local angDifference = (oldAng - newAng) * 0.0625
	local angDifference = (oldAng - newAng) * 2.5000

	vModel:SetPos(newPos + vecDifference)
	vModel:SetAng(newAng + angDifference)

end
