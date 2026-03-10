return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            -- 1. Disable previewers by default for all pickers
            defaults = {
                previewer = false,
            },

            -- 2. Enable it specifically for diagnostics
            lsp = {
                diagnostics = {
                    previewer = "builtin", -- or "bat" if you prefer
                },
                -- You can also enable it for references if you change your mind:
                -- references = { previewer = "builtin" },
            },

            -- Optional: Global UI settings for the preview window
            winopts = {
                preview = {
                    default  = 'hidden',   -- Keeps it hidden unless the picker overrides it
                    layout   = 'vertical',
                    vertical = 'down:45%', -- Preview appears at the bottom
                }
            }
        })

        fzf.register_ui_select()

        -- FZF-Lua mappings
        local opts = { noremap = true, silent = true }

        -- Navigation
        vim.keymap.set('n', '<Leader>b', fzf.buffers, opts)
        vim.keymap.set('n', '<Leader>qq', fzf.files, opts)
        vim.keymap.set('n', '<Leader>qw', fzf.git_files, opts)

        -- Search
        vim.keymap.set('n', '<Leader>rg', fzf.live_grep, opts) -- Better than standard Rg as it updates as you type
        vim.keymap.set('n', '<Leader>ww', fzf.blines, opts)

        -- Neovim Meta
        vim.keymap.set('n', "<Leader>'", fzf.marks, opts)
        vim.keymap.set('n', "<Leader>j", fzf.jumps, opts)
        vim.keymap.set('n', '<Leader>c', fzf.git_commits, opts)
        vim.keymap.set('n', '<Leader>H', fzf.help_tags, opts)

        -- History
        vim.keymap.set('n', '<Leader>hh', fzf.oldfiles, opts)
        vim.keymap.set('n', '<Leader>h:', fzf.command_history, opts)
        vim.keymap.set('n', '<Leader>h/', fzf.search_history, opts)


        -- Find references
        vim.keymap.set("n", "<leader>r", fzf.lsp_references, opts)
        vim.keymap.set("n", "<leader>dd", fzf.diagnostics_document, opts)
        vim.keymap.set("n", "<leader>dw", fzf.diagnostics_workspace, opts)
    end
}
