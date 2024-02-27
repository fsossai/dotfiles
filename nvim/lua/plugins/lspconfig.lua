local on_attach = function(client, bufnr)
    vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    buf_set_keymap('n', 'g.t', '<cmd>Telescope lsp_type_definitions<CR>', opts)
    buf_set_keymap('n', 'g.d', '<cmd>Telescope lsp_definition()<CR>', opts)
    buf_set_keymap('n', 'g.i', '<cmd>lua vim.lsp.buf.implementations()<CR>', opts)
    buf_set_keymap('n', 'g.r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'g.t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'g.s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
    buf_set_keymap('n', '<leader>,', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[a', '<cmd>lua vim.diagnostic.goto_prev({ severity_limit = "Warning" })<CR>', opts)
    buf_set_keymap('n', ']a', '<cmd>lua vim.diagnostic.goto_next({ severity_limit = "Warning" })<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup {}
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
    }
    lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = {},
      },
    }

  end
  -- We don't configure it here, yet. Config happens when the actual language server loads
}
