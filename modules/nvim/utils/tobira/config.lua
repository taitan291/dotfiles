require("tobira").setup({
	lang = "ja",
	idle_delay = 1500, -- ms of inactivity before showing an ambient suggestion
	idle_suggestions = true, -- enable ambient idle suggestions
	suggestion_cooldown = 300, -- s between automatic suggestions (default: 5 min)
	max_shown = 2, -- max times to suggest the same command per session
})
