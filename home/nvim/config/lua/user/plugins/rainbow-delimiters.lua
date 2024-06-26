return {
  'hiphish/rainbow-delimiters.nvim',
  event = 'BufEnter',
  config = function()
    local rd = require('rainbow-delimiters')
    require('rainbow-delimiters.setup').setup({
      -- all coppied from the readme
      strategy = {
        [''] = rd.strategy['global'],
        -- vim = rd.strategy['local'],
        zig = rd.strategy['noop'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
      },
    })
  end,
}
