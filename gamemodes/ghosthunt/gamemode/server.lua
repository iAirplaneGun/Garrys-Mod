if (CLIENT) then
	return
end

function GM:EntityTakeDamage(entity,damageInfo)

	local attacker 	= damageInfo:GetAttacker()
	local damage	= damageInfo:GetDamage()

	if entity:IsPlayer() then

		if attacker:IsPlayer() then
			--damageInfo:ScaleDamage(0)
		end

		if damage >= entity:GetMaxHealth() / 2 then
			entity:RadialBlurPulse(1,6,12)
			entity:ContrastPulse(1,6,32)
			entity:ScreenShake(4,6,12)
			entity:PlaySound("music/player_damage_traumatic.wav")
		end

	end

	return damageInfo

end

function GM:GetFallDamage(player,velocity)

	local CTakeDamageInfo

	velocity = velocity - 580

	velocity = velocity * (100 / (1024 - 580))

	CTakeDamageInfo = DamageInfo()

	CTakeDamageInfo:SetDamage(velocity)
	CTakeDamageInfo:SetDamageType(DMG_FALL)
	CTakeDamageInfo:SetAttacker(game.GetWorld())
	CTakeDamageInfo:SetInflictor(game.GetWorld())
	CTakeDamageInfo:SetDamageForce(Vector(0,0,velocity^2.5))

	player:TakeDamageInfo(CTakeDamageInfo)

	player:EmitSoundTS(table.random({"player/pl_fallpain1.wav","player/pl_fallpain3.wav"}),75,math.random(97,103) * 1.25)

	return 0
end

function GM:Think()

	if (SERVER) then

		for _,player in pairs(player.GetAll()) do

			player.SanityTime = player.SanityTime or engine.CurTime() + math.random(1,2)

			if engine.CurTime() > player.SanityTime then

				player.InsanityCount = player.InsanityCount or 0
				player.InsanityCount = player.InsanityCount + 1

				local chance 	= math.random(1,3)
				local path 		= "player/insanity/"

				if chance == 1 then

					player:RadialBlurPulse(0.25,64,64)
					player:PlaySound(path.."insanity_baby_cry"..math.random(1,3)..".wav")

					player.SanityTime = engine.CurTime() + math.random(12,32)

				elseif chance == 2 then

					player:RadialBlurPulse(0.25,64,64)
					player:ContrastPulse(0.25,64,64)
					player:PlaySound(path.."insanity_whisper0"..math.random(1,3)..".wav")

					player.SanityTime = engine.CurTime() + math.random(1,5)

				elseif chance == 3 then

					player:RadialBlurPulse(0.25,64,64)
					player:ContrastPulse(0.25,64,64)
					player:ScreenFlash(Color(150,0,0,255),64,64)
					player:PlaySound(path.."insanity_monster_roar0"..math.random(1,3)..".wav")

					for i = 1, 300 do

						timer.Simple(0.01 * i,function()

							if player:Alive() then
								player:ViewPunch(math.GenerateAngle(-0.5,0.5))
							end

						end)

					end

					player.SanityTime = engine.CurTime() + math.random(30,35)
				end

				if player.InsanityCount == 10 then
					player:PlaySound("player/breathe1.wav")
				end

			end

		end

	end

end
