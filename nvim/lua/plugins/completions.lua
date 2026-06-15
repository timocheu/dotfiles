return {
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'super-tab',
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'normal'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = {
                documentation = {
                    auto_show = false,
                },
                menu = {
                    auto_show = false,
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'laravel', 'lsp', 'path', 'buffer', 'snippets' },
                providers = {
                    -- ["easy-dotnet"] = {
                    --     name = "easy-dotnet",
                    --     enabled = true,
                    --     module = "easy-dotnet.completion.blink",
                    --     score_offset = 10000,
                    --     async = true,
                    -- },
                    snippets = {
                        should_show_items = function() return false end,
                    },
                    laravel = {
                        name = "laravel",
                        module = "laravel.blink_source",
                    },
                    buffer = {
                        opts = {
                            get_bufnrs = function()
                                return vim.tbl_filter(function(bufnr)
                                    return vim.bo[bufnr].buftype == ''
                                end, vim.api.nvim_list_bufs())
                            end
                        }
                    }
                }
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" },
        config = function(_, opts)
            local blink = require('blink.cmp')

            local show_snippets = false
            local menu_auto = false

            opts.sources.providers.snippets.should_show_items = function()
                return show_snippets
            end

            opts.completion = {
                documentation = { auto_show = false },
                menu = {
                    auto_show = function()
                        return menu_auto
                    end
                }
            }

            blink.setup(opts)

            vim.keymap.set({ 'i', 'n' }, '<A-c>', function()
                menu_auto = not menu_auto

                if menu_auto then
                    vim.notify("Autocomplete: Auto-Show ON", vim.log.levels.INFO)
                else
                    vim.notify("Autocomplete: Manual-Trigger Only", vim.log.levels.WARN)
                    blink.hide() -- Immediately close the menu if it was open
                end
            end, { desc = "blink: toggle auto menu popup" })

            -- Snippet
            vim.keymap.set('i', '<C-q>', function()
                show_snippets = true
                -- Force blink to show only the snippets source
                require('blink.cmp').show({ sources = { 'snippets' } })

                -- We use a timer to flip the switch back to false.
                -- This ensures that next time you type normally, snippets are hidden again.
                vim.defer_fn(function()
                    show_snippets = false
                end, 1000)
            end, { desc = "blink: manual snippet trigger" })
        end,
    },
}
