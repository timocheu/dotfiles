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
      -- local lspconfig = require("lspconfig")

      vim.lsp.config('gopls', {
        capabilities = capabilities,
      })

      vim.lsp.config('intelephense', {
        cmd = { "/home/timocheu/.local/share/intelephense/intelephense.sh" },
        capabilities = capabilities,
        filetypes = { "php" },
        -- root_dir = vim.lsp.util.root_pattern("composer.json", ".git"),
      })

      -- lspconfig['gopls'].setup({ capabilities = capabilities })

      -- Intelephense setup
      -- lspconfig['intelephense'].setup ({
      --   cmd = { "/home/timocheu/.local/share/intelephense/intelephense.sh"},
      --   capabilities = capabilities,
      --   filetypes = { "php" },
      --   root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
      -- })

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
