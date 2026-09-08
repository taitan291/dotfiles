-- Fcitx5 Lua API: https://fcitx-im.org/wiki/LuaAPI

local function skk_custom_handler(_)
	-- Keep the hook installed so SKK-specific behavior can be added here.
	-- Returning false lets Fcitx5 continue processing the key event.
	return false
end

-- Register the hook as an input-method trigger.
ime.register_trigger("skk_hook", "Lua SKK Custom Hook", "SKK用のカスタムフック", "skk_custom_handler")
