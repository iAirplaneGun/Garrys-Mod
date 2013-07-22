function GM:PlayerFootstep(player,vecOrigin,foot,sound,volume,rf)

	if (SERVER) then

		player:EmitSound(sound,volume,math.random(90,110))

	end

	return true
end

function GM:PlayerStepSoundTime(player,iType,bWalking)

	local fStepTime = 250
	local fStepMult	= 1.0
	local fMaxSpeed = player:GetMaxSpeed()

	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then

		if fMaxSpeed <= 100 then
			fStepTime = 400
		end

		if fMaxSpeed <= 300 then
			fStepTime = 350
		end

	elseif iType == STEPSOUNDTIME_ON_LADDER then
		fStepTime = 450
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		fStepTime = 600
	end

	if player:Crouching() then
		fStepTime = fStepTime + 15
	end

	local weapon = player:GetActiveWeapon()

	if weapon:IsValid() then

		if weapon:GetClass() == "weapon_crow" then
			fStepMult = 0.5
		else
			fStepMult = 1.0
		end

	end

	return fStepTime * fStepMult

end

function GM:OnPlayerHitGround(player,bInWater,bOnFloater,fFallSpeed)

	if fFallSpeed >= 200 then

		player:ScreenShake(100,25,0.5)

	end

end
