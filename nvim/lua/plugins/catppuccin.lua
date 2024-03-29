return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- 'loctvl842/monokai-pro.nvim',
  priority = 1000,
  config = function()
    -- require 'monokai-pro'.setup {
    --   -- transparent_background = true,
    --   background_clear = { "float_win" }
    -- }

    local wk = require('which-key')

    local theme_name = 'catppuccin-mocha'
    -- theme_name = 'monokai-pro-spectrum'
    vim.cmd('colorscheme ' .. theme_name)

    wk.register {
      ['<leader>1'] = {
        function()
          vim.cmd('colorscheme ' .. theme_name)
        end,
        "Dark Theme"
      },
      ['<leader>2'] = {
        function()
          vim.cmd('colorscheme base16-gruvbox-material-light-soft')
        end,
        "Light Theme"
      }
    }
  end
}
