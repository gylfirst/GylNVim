return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "marksman", "pylyzer", "ruff" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lsp_cap = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("lua_ls", {
				capabilities = lsp_cap,
			})
			vim.lsp.config("marksman", {
				capabilities = lsp_cap,
			})
			vim.lsp.config("pylyzer", {
				capabilities = lsp_cap,
			})
			vim.lsp.config("ruff", {
				capabilities = lsp_cap,
			})

			vim.lsp.enable({
				"lua_ls",
				"marksman",
				"pylyzer",
				"ruff",
			})
		end,
	},
}
