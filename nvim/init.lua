vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter = blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch = stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  { "folke/zen-mode.nvim" },
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "morhetz/gruvbox" },
  { "nvim-treesitter/nvim-treesitter" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer" },
  { "nvim-lua/plenary.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "sindrets/diffview.nvim" },
  { "mbbill/undotree" },
  { "preservim/tagbar" },
  { "kyazdani42/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim" },
  { "ibhagwan/fzf-lua" },
  { "rhysd/vim-clang-format" },
  { "weilbith/nvim-code-action-menu" },
  { "aznhe21/actions-preview.nvim" },
  { "echasnovski/mini.nvim", version = "*" },
  { "NeogitOrg/neogit", dependencies = { "nvim-lua/plenary.nvim" }, config = true }
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 100, 
      tabline = 1000, 
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
    },
    lualine_b = {
      { "branch",  color={ fg="White" } },
      -- { "diagnostics" },
    },
    lualine_c = {
      { "filename", file_status = true, newfile_status = false, path = 1 },
    },
    lualine_x = {
      -- "encoding", 
      -- "fileformat", 
      "diff"
      -- "filetype"
    },
    lualine_y = {
      { "progress", color = { fg="#2ac3de" } }
    },
    lualine_z = {
      { "location", color = { bg="#2ac3de" } }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

require("nvim-lsp-installer").setup {}

vim.cmd("source " .. vim.fn.stdpath("config") .. "/config.vim")
