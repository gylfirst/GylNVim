return {
	"williamboman/mason.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua-language-server",
			"marksman",
			"pylyzer",
			"ruff",
			"stylua",
			"prettier",
			"debugpy",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)

		local registry = require("mason-registry")
		registry.refresh(function()
			for _, tool in ipairs(opts.ensure_installed) do
				local pkg = registry.get_package(tool)
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end)
	end,
}
