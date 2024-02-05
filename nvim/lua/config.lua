vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  "folke/zen-mode.nvim",
  { "folke/tokyonight.nvim", lazy=false, opts = { transparent=true } },
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "morhetz/gruvbox",
  "nvim-treesitter/nvim-treesitter",
  "ghifarit53/tokyonight-vim",
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "sindrets/diffview.nvim",
  "mbbill/undotree",
  "preservim/tagbar",
  "kyazdani42/nvim-tree.lua",
  "nvim-telescope/telescope.nvim",
  "ibhagwan/fzf-lua",
  "rhysd/vim-clang-format",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  "weilbith/nvim-code-action-menu",
  "aznhe21/actions-preview.nvim",
  { "echasnovski/mini.nvim", version = "*" },
  { "NeogitOrg/neogit", dependencies = { "nvim-lua/plenary.nvim" }, config = true }
}
 
