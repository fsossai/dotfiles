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
  { "bakpakin/fennel.vim" },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "christoomey/vim-tmux-navigator" },
  { "echasnovski/mini.nvim", branch = "stable" },
  { "echasnovski/mini.nvim", version = "*" },
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "folke/zen-mode.nvim" },
  { "gpanders/nvim-parinfer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "ibhagwan/fzf-lua" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "lluchs/vim-wren" },
  { "mbbill/undotree" },
  { "morhetz/gruvbox" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua", config = true },
  { "preservim/tagbar" },
  { "rhysd/vim-clang-format" },
  { "rktjmp/fwatch.nvim" },
  { "RRethy/nvim-base16" },
  { "Shirk/vim-gas" },
  { "sindrets/diffview.nvim" },
  { "tamton-aquib/zone.nvim" },
  { "voldikss/vim-floaterm" },
  { "weilbith/nvim-code-action-menu" },
}

vim.cmd("source " .. vim.fn.stdpath("config") .. "/config.vim")
