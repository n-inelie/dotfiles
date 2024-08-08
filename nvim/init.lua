-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			"folke/which-key.nvim",
			lazy = true,
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},
		{
			"stevearc/dressing.nvim",
			opts = {},
		},
		{
			-- colorscheme
			"2nthony/vitesse.nvim",
			dependencies = {
				"tjdevries/colorbuddy.nvim",
			},
		},
		{
			"jinh0/eyeliner.nvim",
			config = function()
				require("eyeliner").setup({
					highlight_on_key = true,
					dim = true,
				})
			end,
		},
		{
			"nvim-lualine/lualine.nvim",
			config = function()
				require("lualine").setup({
					options = {
						icons_enabled = true,
						theme = "auto",
						component_separators = { left = "", right = "" },
						section_separators = { left = "", right = "" },
						disabled_filetypes = {
							statusline = {},
							winbar = {},
						},
						ignore_focus = {},
						always_divide_middle = true,
						globalstatus = false,
						refresh = {
							statusline = 1000,
							tabline = 1000,
							winbar = 1000,
						},
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch", "diff", "diagnostics" },
						lualine_c = { "filename" },
						lualine_x = { "encoding", "filetype" },
						lualine_y = { "progress" },
						lualine_z = { "location" },
					},
					inactive_sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = { "filename" },
						lualine_x = { "location" },
						lualine_y = {},
						lualine_z = {},
					},
					tabline = {},
					winbar = {},
					inactive_winbar = {},
					extensions = {},
				})
			end,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"hrsh7th/nvim-cmp",
			},
			lazy = false,
			config = function()
				require("mason").setup()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"rust_analyzer",
						"clangd",
						"pyright",
						"bashls",
						"gopls",
						"ast_grep",
						"kotlin_language_server",
						"cssls",
						"eslint",
					},
				})
				local lsp = require("lspconfig")

				local on_attach = function(client, bufnr)
					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end
					local function buf_set_option(...)
						vim.api.nvim_buf_set_option(bufnr, ...)
					end

					buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

					local opts = { noremap = true, silent = true }

					-- See `:help vim.lsp.*` for documentation on any of the below functions
					buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
					buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
					buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
					buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
					buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
					buf_set_keymap(
						"n",
						"<space>wl",
						"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
						opts
					)
					buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
					buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
					buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
					buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
					buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
					buf_set_keymap("n", "<S-C-j>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
					buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
					buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
				end

				lsp.clangd.setup({
					on_attach = on_attach,
				})
			end,
		},
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						c = { "clang-format" },
						cpp = { "clang-format" },
						lua = { "stylua" },
						python = { "black" },
						rust = { "rustfmt" },
						javascript = { "prettierd", "prettier", stop_after_first = true },
					},
					format_on_save = {
						timeout_ms = 500,
						lsp_format = "fallback",
					},
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
		},
		{
			"nvim-telescope/telescope.nvim",
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
			config = function()
				vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
				vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
				vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
				vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

				require("neo-tree").setup({
					enable_git_status = false,
					file_size = {
						enabled = false,
					},
					type = {
						enabled = false,
					},
					last_modified = {
						enabled = false,
					},
					created = {
						enabled = false,
					},
					symlink_target = {
						enabled = false,
					},
					window = {
						position = "left",
						width = 35,
					},
					filesystem = {
						filtered_items = {
							visible = true,
							hide_dotfiles = false,
							hide_gitignored = false,
							hide_hidden = false,
							hide_by_name = {
								"node_modules",
							},
						},
					},
				})
			end,
		},
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.background = "light"
opt.cursorline = true
vim.cmd("colorscheme vitesse")

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true
opt.smartindent = true
opt.linebreak = true
opt.breakindent = true

opt.clipboard:append("unnamedplus")

if vim.g.neovide then
	vim.o.guifont = "Monaspace Neon:h13"
end

local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })

keymap.set("v", "<C-c>", "+Y", { desc = "Copy to system clipboard" })
keymap.set("n", "<C-v>", "+p", { desc = "Paste from system clipboard" })

keymap.set("n", "ge", "G", {})
keymap.set("n", "U", "<C-r>", {})
