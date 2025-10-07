return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config('markdown_oxide', {
        -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
        -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
        capabilities = vim.tbl_deep_extend(
          'force',
          capabilities,
          {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = true,
              },
            },
          }
        ),
      })

      vim.lsp.config('gopls', {
        capabilities = capabilities,
      })

      vim.lsp.config('intelephense', {
        cmd = { "/home/timocheu/.local/share/intelephense/intelephense.sh" },
        capabilities = capabilities,
        filetypes = { "php" },
        -- root_dir = vim.lsp.util.root_pattern("composer.json", ".git"),
      })

      vim.lsp.config('lua_ls', {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using (most
              -- likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Tell the language server how to find Lua modules same way as Neovim
              -- (see `:h lua-module-load`)
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths
                -- here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library'
              }
              -- Or pull in all of 'runtimepath'.
              -- NOTE: this is a lot slower and will cause issues when working on
              -- your own configuration.
              -- See https://github.com/neovim/nvim-lspconfig/issues/3189
              -- library = {
              --   vim.api.nvim_get_runtime_file('', true),
              -- }
            }
          })
        end,
        settings = {
          Lua = {}
        }
      })

      -- LSP functions keymap
      local opts = { noremap = true, silent = true }

      -- Go to definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

      -- Go to implementation
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

      -- Find references
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      -- Hover documentation
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- Signature help
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

      -- Rename symbol
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      -- Code action (normal + visual)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      -- Diagnostic navigation
      vim.keymap.set("n", "<leader>es", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = "minimal",
      })
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
  }
}
