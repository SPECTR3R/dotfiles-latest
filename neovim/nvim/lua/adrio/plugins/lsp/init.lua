return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"RRethy/vim-illuminate",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "williamboman/mason.nvim", config = true },
		},
		event = "BufReadPre",
		config = function()
			require("adrio.plugins.lsp.config")
			require("adrio.plugins.lsp.handlers")
		end,
	},
	{
		"folke/trouble.nvim",
		event = "LspAttach",
		opts = {
			focus = true,
			auto_open = false,
			auto_jump = false,
			auto_refresh = false,
		},
	},
	-- code formatters
	{
		"nvimtools/none-ls.nvim",
		event = "LspAttach",
		config = function()
			local nls = require("null-ls")

			nls.setup({
				debug = false,
				sources = {
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.nixpkgs_fmt,
					nls.builtins.diagnostics.yamllint.with({
						args = require("adrio.plugins.lsp.lang.yamllint"),
					}),
					nls.builtins.formatting.prettierd.with({
						disabled_filetypes = { "markdown", "yaml" },
					}),
					-- nls.builtins.formatting.sql_formatter.with({
					--     command = { "sleek" },
					-- }),
				},
			})
		end,
	},
	-- Lsp notifications
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
}