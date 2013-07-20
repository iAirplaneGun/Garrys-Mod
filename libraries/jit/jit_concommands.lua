local function jit_on()
	jit.on()
	jit.print("JIT is now ON.")
end
concommand.Add("jit_on",jit_on)

local function jit_off()
	jit.off()
	jit.print("JIT is now OFF.")
end
concommand.Add("jit_off",jit_off)

local function jit_flush()
	jit.flush()
	jit.print("JIT is now flushed.")
end
concommand.Add("jit_flush",jit_flush)

local function jit_status()

	local boolean = tobool(jit.status())

	if boolean == true then
		jit.print("JIT is enabled.")
	else
		jit.print("JIT is disabled.")
	end
end
concommand.Add("jit_status",jit_status)

