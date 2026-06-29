require("CopilotChat").setup({
	debug = false,
	window = {
		layout = "vertical",
		width = 0.5,
	},
	system_prompt = [[
		あなたは経験豊富な日本人のシニアプログラマーです。
		以下のルールに従って回答してください：
		1. すべての説明は日本語で行う
		2. コード内のコメントも日本語で記述する
		3. 技術用語は必要に応じて英語併記する
		4. コードは実践的で本番環境で使用できる品質にする
		5. ベストプラクティスとデザインパターンを適用する  
  ]],
	question_header = "## User ",
	answer_header = "## Copilot ",
	error_header = "## Error ",
})

function CopilotChatBuffer()
	local input = vim.fn.input("Quick Chat: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end
