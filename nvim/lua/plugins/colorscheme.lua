return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		-- config = function()
		--     vim.cmd("colorscheme tokyonight-moon")
		-- end
	},
	{
		"Biscuit-Theme/nvim",
		lazy = false,
		priority = 1000,
	},
    {
      "xero/miasma.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd("colorscheme miasma")
      end,
    }
}
