function GM:PlayerDeath(victim,inflictor,killer)

end

function GM:DoPlayerDeath(player,attacker,damagInfo)

	player:CreateRagdoll()

end
