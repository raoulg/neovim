return {
	{ "mfussenegger/nvim-dap" },
	{ "theHamsta/nvim-dap-virtual-text", opts = {} },
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
			require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
			vim.fn.sign_define("DapBreakpoint", { text = "🐞", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "⭐", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "launch",
				name = "Python Debug",
				program = "${file}",
				-- console = "integratedTerminal",
				-- module = "src", -- edit this to be your app's main module
				cwd = "${workspaceFolder}",
			})
		end,
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }, opts = true },
}
