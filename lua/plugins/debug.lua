return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		event = "BufEnter *.py",
		keys = {
			{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "breakpoint" },
			{ "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "continue" },
			{ "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", desc = "step over" },
			{ "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "step into" },
			{ "<leader>dI", "<cmd>lua require('dap').step_out()<CR>", desc = "step out" },
		},
	},
	{ "theHamsta/nvim-dap-virtual-text", opts = {}, lazy = true, event = "BufEnter *.py" },
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		event = "BufEnter *.py",
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
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = true,
		lazy = true,
		event = "BufEnter *.py",
		keys = {
			{ "<leader>dt", "<cmd>lua require'dapui'.toggle()<CR>", desc = "toggle ui" },
			{ "<leader>dr", "<cmd>lua require'dapui'.open({ reset = true })<CR>", desc = "reset ui" },
		},
	},
}
