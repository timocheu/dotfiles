return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = opts.sources or {}
        table.insert(opts.sources, nls.builtins.formatting.prettier)

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
    -- config = function()
    --     local null_ls = require("null-ls")
    --     null_ls.setup({ null_ls.builtins.formatting.stylua })
    --
    --     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    -- end
}
