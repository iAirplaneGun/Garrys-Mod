if (SERVER) then
	return
end

function GM:HUDPaint()

	local player = LocalPlayer()

	local health = player:Health()

	surface.DrawRect(0,0,surface.ScreenWidth(),surface.ScreenHeight(),Color(255,255,255,255))

end

function GM:HUDShouldDraw(element)
	return false
end
