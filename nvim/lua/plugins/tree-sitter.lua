return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local parser_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser"
			local has_parsers = vim.fn.isdirectory(parser_dir) == 1
				and #vim.fn.globpath(parser_dir, "/*.so", false, true) > 0

			if not has_parsers then
				vim.defer_fn(function()
					vim.notify("Treesitter: parsers manquants, installation en cours...", vim.log.levels.INFO)
					vim.cmd("TSUpdate")
					vim.defer_fn(function()
						vim.notify("Treesitter: parsers installés, redémarrez Neovim", vim.log.levels.INFO)
					end, 5000)
				end, 100)
				return
			end

			local ok, configs = pcall(require, "nvim-treesitter.configs")
			if not ok then
				vim.defer_fn(function()
					vim.cmd("TSUpdate")
					vim.notify("Treesitter: parsers installés, redémarrez Neovim", vim.log.levels.INFO)
				end, 100)
				return
			end
			configs.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
