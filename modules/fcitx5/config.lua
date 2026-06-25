-- 参考: https://fcitx-im.org/wiki/LuaAPI

local function skk_custom_handler(key)
	-- 現在のインプットメソッドがskkかどうかを判定
	if fcitx.currentInputMethod() == "skk" then

		-- return true -- イベントを消費した場合
	end
	return false -- イベントを通過させる場合
end

-- キーイベントの前処理に登録
ime.register_trigger("skk_hook", "Lua SKK Custom Hook", "SKK用のカスタムフック", "skk_custom_handler")
