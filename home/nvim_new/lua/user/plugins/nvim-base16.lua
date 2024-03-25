return {
  'RRethy/base16-nvim',
  dependencies = {
    {
      'NvChad/nvim-colorizer.lua',
      opts = {
        filetypes = { '*' },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = false, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = false, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          mode = 'background', -- Set the display mode. foreground, background,  virtualtext
          virtualtext = '██', --■, , 
        },
        buftypes = {},
      },
    },
  },
  lazy = false,
  priority = 1000,
  config = function()
    local base16 = require('base16-colorscheme')

    local config = {
      telescope = false,
      indentblankline = true,
      notify = true,
      ts_rainbow = false,
      cmp = true,
      illuminate = false,
    }

    local colors = require('user.generated_base16_colors')

    base16.setup(colors, config)

    -- modifications and additions to nvim-base16's somewhat opinionated highlighting choices

    vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = colors.base08, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = colors.base09, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = colors.base0A, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = colors.base0B, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = colors.base0C, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = colors.base0D, bg = nil })
    vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = colors.base0E, bg = nil })

    -- vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.base01, bg = colors.base01 })

    vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.base03, bg = colors.base00 })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.base04, bg = colors.base00 })

    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.base01 })
    vim.api.nvim_set_hl(0, 'Float', { bg = colors.base01 })

    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.base02, bg = colors.base00 })

    vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = colors.base01 })
    vim.api.nvim_set_hl(0, 'MiniCursorwordCurrent', { bg = colors.base01 })

    -- https://github.com/RRethy/nvim-base16/blob/master/lua/base16-colorscheme.lua
    -- for more info. Most @___ like to TS___ (eg. @type links to TSType)
    vim.api.nvim_set_hl(0, '@lsp.type.namespace', { link = '@namespace' })
    vim.api.nvim_set_hl(0, '@lsp.type.type', { link = '@type' })
    vim.api.nvim_set_hl(0, '@lsp.type.class', { link = '@type' })
    vim.api.nvim_set_hl(0, '@lsp.type.enum', { link = '@type' })
    vim.api.nvim_set_hl(0, '@lsp.type.interface', { link = '@type' })
    vim.api.nvim_set_hl(0, '@lsp.type.struct', { link = '@structure' })
    vim.api.nvim_set_hl(0, '@lsp.type.parameter', { link = '@parameter' })
    vim.api.nvim_set_hl(0, '@lsp.type.variable', { link = '@variable' })
    vim.api.nvim_set_hl(0, '@lsp.type.property', { link = '@property' })
    vim.api.nvim_set_hl(0, '@lsp.type.enumMember', { link = '@constant' })
    vim.api.nvim_set_hl(0, '@lsp.type.function', { link = '@function' })
    vim.api.nvim_set_hl(0, '@lsp.type.method', { link = '@method' })
    vim.api.nvim_set_hl(0, '@lsp.type.macro', { link = '@macro' })
    vim.api.nvim_set_hl(0, '@lsp.type.decorator', { link = '@function' })

    -- this deviates from the base16 spec, but IMO looks better. See
    -- https://github.com/base16-project/base16/blob/main/styling.md
    -- for more info. Probably only works with limited base16 schemes.
    vim.api.nvim_set_hl(0, 'TSProperty', { fg = colors.base0C }) --was base05
    vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.base05 }) --was base08
    vim.api.nvim_set_hl(0, 'TSVariable', { fg = colors.base05 }) --was base08
    vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = colors.base05 }) --was base0F
    --vim.api.nvim_set_hl(0, 'TSBoolean', { fg = colors.base0E }) --was base09
    vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.base0A }) --was base0F
  end,
}
