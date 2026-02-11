return {
  -- 1. COLORIZAÇÃO DE CÓDIGO (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "bash",
          "json",
        })
      end
    end,
  },

  -- 2. TRANSPARÊNCIA
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NotifyBackground",
          "NoiceFormatProgressDone",
          "FloatBorder",
        },
      })
      vim.cmd("TransparentEnable")
    end,
  },

  -- 3. SNIPPETS (rfce, rafce, etc.)
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      -- Carrega os snippets do friendly-snippets (estilo VS Code)
      require("luasnip.loaders.from_vscode").lazy_load()
      -- FORÇAR O REACT: Faz arquivos de React lerem snippets de JS comum
      luasnip.filetype_extend("javascriptreact", { "javascript" })
      luasnip.filetype_extend("typescriptreact", { "typescript" })
    end,
  },
}
