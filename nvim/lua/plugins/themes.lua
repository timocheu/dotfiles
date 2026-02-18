return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fg = "#FFEB3B"

      require("nightfox").setup({
        groups = {
          all = {
            Number = { fg = "white" },
            Identifier = { fg = "white" },
            ["@variable"] = { fg = "white" },
            ["@variable.parameter"] = { fg = "white" },
            ["@variable.member"] = { fg = "white" },

            -- Data type
            Type = { fg = fg },
            ["@type"] = { fg = fg },
            ["@type.builtin"] = { fg = fg },

            Conditional = { fg = fg },
            Function = { fg = "white" },
            Keyword = {fg = "#FF4A3A"},
            PreProc = {fg = "white"}
          },
        },
      })

      vim.cmd.colorscheme('carbonfox')

      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange', bold = true })
      vim.cmd("hi ColorColumn ctermbg=darkred guibg=darkred")
    end
  },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_better_performance = 1
  --
  --     vim.cmd.colorscheme('gruvbox-material')
  --     vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'orange', bold = true })
  --     vim.cmd("hi ColorColumn ctermbg=darkred guibg=darkred")
  --   end
  -- },
}
