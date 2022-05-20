--       _        _             _ _              _
--   ___| |_ __ _| |_ _   _ ___| (_)_ __   ___  | |_   _  __ _
--  / __| __/ _` | __| | | / __| | | '_ \ / _ \ | | | | |/ _` |
--  \__ \ || (_| | |_| |_| \__ \ | | | | |  __/_| | |_| | (_| |
--  |___/\__\__,_|\__|\__,_|___/_|_|_| |_|\___(_)_|\__,_|\__,_|

local cp = require('catppuccin.core.color_palette')
local separators = require('nvim-stratus.ui.separators')
local builtins = require('nvim-stratus.builtins')

local components = {
  {
    operation = builtins.current_mode,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui = 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.git_branch,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui = 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.filename,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui = 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.modified,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui = 'bold',
    },
    separator = separators.arrow,
  },
  {
    operation = builtins.spell_check,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui = 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
  {
    operation = builtins.file_directory,
    style = {
      fg = cp.black2,
      bg = cp.pink,
      gui = 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
  {
    operation = builtins.percentage_line_count,
    style = {
      fg = cp.black2,
      bg = cp.gray2,
      gui = 'bold',
    },
    separator = separators.arrow,
    position = 'right',
  },
}

local mode_colors = {
  ['NORMAL'] = cp.gray2,
  ['INSERT'] = cp.green,
}

require('nvim-stratus').setup(components, mode_colors)