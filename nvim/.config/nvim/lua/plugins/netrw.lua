return {
  {
    'prichrd/netrw.nvim',
    opts = {
      icons = {
        symlink = '',
        directory = '',
        file = '',
      },
      -- Uses mini.icon or nvim-web-devicons if true, otherwise use the file icon specified above
      use_devicons = true,
      mappings = {
        -- Function mappings receive an object describing the node under the cursor
        ['p'] = function(payload) print(vim.inspect(payload)) end,
        -- String mappings are executed as vim commands
        ['<Leader>p'] = ":echo 'hello world'<CR>",
      },
    }
  },
  {
    "tpope/vim-vinegar", -- Optional: better netrw UX
    -- Set line numbers in netrw
    event = "BufEnter",
    config = function()
      -- Listing style
      vim.g.netrw_liststyle = 1

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        callback = function()
          vim.wo.number = true
          vim.wo.relativenumber = true
        end,
      })
    end,
  }
}
