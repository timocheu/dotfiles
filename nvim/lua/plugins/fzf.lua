return {
  'junegunn/fzf.vim',
  dependencies = {
    'junegunn/fzf',
  },
  config = function()
      -- FZF mappings in Lua
  local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>b', ':Buffers<CR>', opts)
    vim.keymap.set('n', '<Leader>qq', ':Files<CR>', opts)
    vim.keymap.set('n', '<Leader>qw', ':GFiles<CR>', opts)
    vim.keymap.set('n', '<Leader>rg', ':Rg<CR>', opts) -- Uncomment if using :Rg
    vim.keymap.set('n', '<Leader>ww', ':BLines<CR>', opts)
    vim.keymap.set('n', "<Leader>'", ':Marks<CR>', opts)
    vim.keymap.set('n', "<Leader>j", ':Jumps<CR>', opts)
    vim.keymap.set('n', '<Leader>g', ':Commits<CR>', opts)
    vim.keymap.set('n', '<Leader>H', ':Helptags<CR>', opts)
    vim.keymap.set('n', '<Leader>hh', ':History<CR>', opts)
    vim.keymap.set('n', '<Leader>h:', ':History:<CR>', opts)
    vim.keymap.set('n', '<Leader>h/', ':History/<CR>', opts)
  end
}
