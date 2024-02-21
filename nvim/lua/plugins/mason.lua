return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup {}
    mason_lspconfig.setup {
      ensure_installed = {
        -- 'clangd',
        -- 'rust_analyzer',
        -- 'lua-language-server',
        -- 'pyright',
      },
      automatic_installation = true,
    }
  end
}
