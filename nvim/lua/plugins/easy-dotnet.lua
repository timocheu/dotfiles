return {
  "GustavEikaas/easy-dotnet.nvim",
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local dotnet = require("easy-dotnet")

    -- Options are not required
    dotnet.setup({
      lsp = {
        enabled = true,                      -- Enable builtin roslyn lsp
        -- roslynator_enabled = true,           -- Automatically enable roslynator analyzer
        easy_dotnet_analyzer_enabled = true, -- Enable roslyn analyzer from easy-dotnet-server
        -- auto_refresh_codelens = true,
        analyzer_assemblies = {},
        -- config = { capabilities = capabilities, },
      },
    })
  end
}
