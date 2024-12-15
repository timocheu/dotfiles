require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "css", "html"},
  highlight = {enable = true},
  indent = {enable = true}
}
