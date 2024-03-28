local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports-reviser", "gofumpt" },
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
		json = { "biome" },
		yaml = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
	},
	-- format_on_save = { timeout_ms = 500, lsp_fallback = true },
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.keymap.set({ "n", "v" }, "<leader>fo", "<Cmd>Format<cr>")
