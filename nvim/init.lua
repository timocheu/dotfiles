-- Path to mason
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Visuals & Colors
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "81"
vim.opt.guicursor = "i:block" -- Keeps block cursor in Insert mode
--
-- -- Line Numbers (Hybrid mode: current line is absolute, others are relative)
vim.opt.number = true
vim.opt.relativenumber = true
--
-- -- Tab / Indentation
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.listchars = {
    trail = '·'
}

-- Keymaps
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Code Runner
vim.keymap.set('n', '<F5>', ':RunCode<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<F6>', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })

require("config.lazy")
