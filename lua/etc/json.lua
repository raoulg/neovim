local Jqx = require("nvim-jqx")

--NOTE: use JqxList for a nice JSON navigator, but I don't want to waste a keybinding on it

sethighlight("jsonKeyword", {fg=colors.cyan})
sethighlight("jsonKeywordMatch", {fg=colors.pink})
sethighlight("jsonQuote", {fg=colors.yellow})
sethighlight("jsonBraces", {fg=colors.pink})
