-- ~/.config/nvim/init.lua

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Basic settings
vim.g.mapleader = " " -- Set leader key to space
vim.opt.number = true -- Show line numbers
-- vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.wrap = false -- Don't wrap lines
vim.opt.breakindent = true -- Preserve indentation in wrapped text
vim.opt.tabstop = 2 -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2 -- Number of spaces to use for autoindent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.termguicolors = true -- Enable 24-bit RGB color

-- Plugins
require("lazy").setup({
  -- Required by many plugins
  "nvim-tree/nvim-web-devicons",
  
  -- File tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight"
        }
      })
    end
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
    }
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end
  },
})

-- File tree setup
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
