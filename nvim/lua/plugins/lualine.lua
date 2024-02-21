return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
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
  end
}
