return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Map .blade.php files to the blade filetype
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
