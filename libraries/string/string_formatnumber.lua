function string.FormatNumber(raw_number)
	local new_number,_ = string.gsub(string.gsub(string.gsub(raw_number,"^(-?%d+)(%d%d%d)","%1,%2"),"^(-?%d+)(%d%d%d)","%1,%2"),"^(-?%d+)(%d%d%d)","%1,%2")

	return new_number
end
