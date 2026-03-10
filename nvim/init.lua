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

require("config.lazy")
