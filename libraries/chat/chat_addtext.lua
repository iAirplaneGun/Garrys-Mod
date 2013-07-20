if (CLIENT) then

	function chat.AddTextFromServer()

		local table = net.ReadTable()

		chat.AddText(unpack(table))
		return nil

	end

	net.Receive("chat.AddTextFromServer",chat.AddTextFromServer)

end

if (SERVER) then

	util.AddNetworkString("chat.AddTextFromServer")

	chat = chat or {}

	function chat.AddText(...)

		local arguments,player = {...},nil

		if type(arguments[1]) == "player" then
			player = table.remove(arguments,1)
		end

		net.Start("chat.AddTextFromServer")

		net.WriteTable(arguments)

		if player != nil then
			net.Send(player)
		else
			net.Broadcast()
		end

	end

end
