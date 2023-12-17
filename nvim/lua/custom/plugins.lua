local plugins = {
  {
    "L3MON4D3/LuaSnip",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    lazy = false,
    config = function(_)
      require "custom.configs.LuaSnip"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- { name = "buffer" }, Don't want to suggest words in the buffer
        { name = "nvim_lua" },
        { name = "path" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function(_)
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function(_)
      require "custom.configs.mason"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function(_)
      require "custom.configs.conform"
    end,
  },
  {
    "dccsillag/magma-nvim",
    ft = { "python" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "lervag/vimtex",
    ft = { "latex", "tex" },
    config = function(_)
      require "custom.configs.vimtex"
    end,
  },
  {
    "MunifTanjim/prettier.nvim",
    lazy = false,
    config = function(_)
      require "custom.configs.prettier"
    end,
  },
  {
    url = "https://github.com/edgedb/edgedb-vim.git",
    ft = { "edgeql", "esdl" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        custom = { "^.DS_STORE$", "^.git$", "^.fls$", "^.synctex.gz$", "^.aux$", "^.fdb_latexmk$" },
      },
    },
  },
}
return plugins
