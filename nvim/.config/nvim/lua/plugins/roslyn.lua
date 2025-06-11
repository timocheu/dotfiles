return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = function ()
    -- your configuration comes here; leave empty for default settings
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    return {
      capabilities = capabilities,
      -- You can add more config if needed, e.g., cmd, on_attach, etc.
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("*.csproj", ".git")(fname)
            or vim.fn.getcwd()
      end,

    }
  end,
}
