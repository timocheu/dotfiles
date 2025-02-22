set rnu
set cul 
set nocompatible
set hidden
set guicursor=n-v-c-i:block

" <Tab> distance
set tabstop=4
set shiftwidth=4
set expandtab

" Additional config files
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/keymaps.vim
source ~/.config/nvim/config/settings.vim

lua << EOF
    require('coc')
    require('treesitter-configs')
    require('live-server').setup(opts)
    
    local ctp_feline = require('catppuccin.groups.integrations.feline')
    ctp_feline.setup()

    require("feline").setup({
        components = ctp_feline.get(),
    })

    vim.diagnostic.config({
      virtual_text = true,  -- Always show diagnostics as virtual text
      signs = true,         -- Show signs in the gutter
      underline = true,     -- Underline problematic text
      update_in_insert = false, -- Do not update diagnostics while in insert mode
      float = {
        show_header = true,
        source = "always",
        border = "rounded",
      },
    })
EOF

