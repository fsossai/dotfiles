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
  { import = "plugins" },
  { "aznhe21/actions-preview.nvim" },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "echasnovski/mini.nvim", version = "*" },
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "folke/zen-mode.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  -- { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "ibhagwan/fzf-lua" },
  { "christoomey/vim-tmux-navigator" },
  { "lluchs/vim-wren" },
  { "gpanders/nvim-parinfer" },
  { "bakpakin/fennel.vim" },
  { "rktjmp/fwatch.nvim" },
  { "echasnovski/mini.nvim", branch = "stable" },
  { "Shirk/vim-gas" },
  { "RRethy/nvim-base16" },
  { "preservim/tagbar" },
  { "junegunn/fzf" },
  -- { "ziontee113/SelectEase" },
  { "junegunn/fzf.vim" },
  -- { "lewis6991/gitsigns.nvim" },
  -- { "rcarriga/nvim-notify" },
  -- { "smoka7/hop.nvim" },
  { "mbbill/undotree" },
  { "morhetz/gruvbox" },
  { "MunifTanjim/nui.nvim" },
  -- { "NeogitOrg/neogit" },
  -- { "neovim/nvim-lspconfig" },
  -- { "numToStr/Comment.nvim" },
  -- { "nvim-lualine/lualine.nvim" },
  -- { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua", config = true },
  -- { "nvim-tree/nvim-web-devicons" },
  -- { "nvim-treesitter/nvim-treesitter" },
  { "preservim/tagbar" },
  { "rhysd/vim-clang-format" },
  { "sindrets/diffview.nvim" },
  { "tamton-aquib/zone.nvim" },
  { "voldikss/vim-floaterm" },
  { "weilbith/nvim-code-action-menu" },
  -- { "williamboman/mason-lspconfig.nvim" },
  -- { "williamboman/mason.nvim" },
  -- { "williamboman/nvim-lsp-installer" },
}

vim.cmd("source " .. vim.fn.stdpath("config") .. "/config.vim")
