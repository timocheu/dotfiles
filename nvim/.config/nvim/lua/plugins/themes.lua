return {
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd("colorscheme carbonfox")
  --   end
  -- },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme('gruvbox-material')
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange', bold = true })
      vim.cmd("hi ColorColumn ctermbg=darkred guibg=darkred")
    end
  },
}
