return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
  "lervag/vimtex",
  ft = "tex",
  init = function()
    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
  end,
},
  {
    "nvim-neorg/neorg",
    ft = "norg",
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  notes = "~/Documents/Notes/",
                },
                default_workspace = "notes",
              },
            },
          },
        }
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "norg", "go"
      },
      highlight = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
