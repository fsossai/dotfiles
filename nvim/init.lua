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
  { "aznhe21/actions-preview.nvim" },
  { "catppuccin/nvim", name = "catppuccin", opts = { transparent_background = true } },
  { "echasnovski/mini.nvim", version = "*" },
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "folke/zen-mode.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/vim-vsnip" },
  { "ibhagwan/fzf-lua" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "mbbill/undotree" },
  { "morhetz/gruvbox" },
  { "MunifTanjim/nui.nvim" },
  { "NeogitOrg/neogit", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
  { "neovim/nvim-lspconfig" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-tree/nvim-tree.lua", name = "nvim-tree" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-treesitter/nvim-treesitter" },
  { "preservim/tagbar" },
  { "rhysd/vim-clang-format" },
  { "sindrets/diffview.nvim" },
  { "tamton-aquib/zone.nvim" },
  { "voldikss/vim-floaterm" },
  { "weilbith/nvim-code-action-menu" },
  { "williamboman/nvim-lsp-installer" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
}

require("nvim-treesitter.configs").setup {
  incremental_selection = { 
    enable = true,
    keymaps = {
      init_selection = ".",
      scope_incremental = "<CR>",
      node_incremental = ".",
      node_decremental = ",",
    },
  },
  highlight = {
    enable = true,
  },
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

require("nvim-tree").setup{}

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
    buf_set_keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<cmd>Telescope lsp_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementations()<CR>', opts)
    buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>,', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev({ severity_limit = "Warning" })<CR>', opts)
    buf_set_keymap('n', 'g]', '<cmd>lua vim.diagnostic.goto_next({ severity_limit = "Warning" })<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
end

local cmp = require("cmp")
cmp.setup{
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
}

local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )
}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

require("nvim-lsp-installer").setup {}
require("mason").setup {}
require("mason-lspconfig").setup {
  ensure_installed = {
    -- "clangd",
    -- "pyright",
  },
  automatic_installation = true,
}
require("mason-lspconfig").setup_handlers {
  -- require("core.lsp").setup_server
}

vim.cmd("source " .. vim.fn.stdpath("config") .. "/config.vim")
