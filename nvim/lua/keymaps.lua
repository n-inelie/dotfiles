vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", {})

keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", {})
keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>", {})
