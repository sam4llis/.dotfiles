if !has("nvim-0.5.0")
    finish
endif

lua <<EOF
  local lsp = require("feline.providers.lsp")
  local lsp_severity = vim.diagnostic.severity
  local b = vim.b

  local assets = {
    left_semicircle = "",
    right_semicircle = "",
    right_semicircle_cut = "",
    left_semicircle_cut = "",
    vertical_bar_chubby = "█",
    vertical_bar_medium = "┃",
    vertical_bar_thin = "│",
    left_arrow_thin = "",
    right_arrow_thin = "",
    left_arrow_filled = "",
    right_arrow_filled = "",
    slant_left = "",
    slant_left_thin = "",
    slant_right = "",
    slant_right_thin = "",
    slant_left_2 = "",
    slant_left_2_thin = "",
    slant_right_2 = "",
    slant_right_2_thin = "",
    chubby_dot = "●",
    slim_dot = '•',
  }

  local clrs = require("catppuccin.core.color_palette")

  -- settings
  local sett = {
    bkg = clrs.black0,
    diffs = clrs.black2,
    extras = clrs.gray1,
    curr_file = clrs.maroon,
    curr_dir = clrs.flamingo,
  }

  local mode_colors = {
    ["n"] = { "NORMAL", clrs.lavender },
    ["no"] = { "N-PENDING", clrs.lavender },
    ["i"] = { "INSERT", clrs.green },
    ["ic"] = { "INSERT", clrs.green },
    ["t"] = { "TERMINAL", clrs.green },
    ["v"] = { "VISUAL", clrs.flamingo },
    ["V"] = { "V-LINE", clrs.flamingo },
    [""] = { "V-BLOCK", clrs.flamingo },
    ["R"] = { "REPLACE", clrs.maroon },
    ["Rv"] = { "V-REPLACE", clrs.maroon },
    ["s"] = { "SELECT", clrs.maroon },
    ["S"] = { "S-LINE", clrs.maroon },
    [""] = { "S-BLOCK", clrs.maroon },
    ["c"] = { "COMMAND", clrs.peach },
    ["cv"] = { "COMMAND", clrs.peach },
    ["ce"] = { "COMMAND", clrs.peach },
    ["r"] = { "PROMPT", clrs.teal },
    ["rm"] = { "MORE", clrs.teal },
    ["r?"] = { "CONFIRM", clrs.mauve },
    ["!"] = { "SHELL", clrs.green },
  }

  local shortline = false

  -- Initialize the components table
  local components = {
    active = {},
    inactive = {},
  }

  table.insert(components.active, {}) -- (1) left
  table.insert(components.active, {}) -- (2) center
  table.insert(components.active, {}) -- (3) right

  table.insert(components.inactive, {}) -- (1) left
  table.insert(components.inactive, {}) -- (2) center
  table.insert(components.inactive, {}) -- (3) right

  -- global components
  local invi_sep = {
    str = " ",
    hl = {
      fg = sett.bkg,
      bg = sett.bkg,
    },
  }

  -- helpers
  local function any_git_changes()
    local gst = b.gitsigns_status_dict -- git stats
    if gst then
      if gst["added"] and gst["added"] > 0 or gst["removed"] and gst["removed"] > 0 or gst["changed"] and gst["changed"] > 0 then
        return true
      end
    end
    return false
  end


  -- #################### STATUSLINE ->


  -- ######## Left

  -- Current vi mode ------>
  local vi_mode_hl = function()
    return {
      fg = sett.bkg,
      bg = mode_colors[vim.fn.mode()][2],
      style = "bold"
    }
  end

  components.active[1][1] = {
    provider = assets.left_semicircle,
    hl = function()
      return {
        fg = mode_colors[vim.fn.mode()][2],
        bg = sett.bkg,
      }
    end,
  }

  components.active[1][2] = {
    hl = function()
      return {
        fg = sett.bkg,
        bg = mode_colors[vim.fn.mode()][2],
      }
    end,
  }

  components.active[1][3] = {
    provider = function()
      return " " .. mode_colors[vim.fn.mode()][1] .. " "
    end,
    hl = vi_mode_hl,
  }

  components.active[1][4] = {
    provider = assets.right_semicircle,
    hl = function()
      return {
        fg = mode_colors[vim.fn.mode()][2],
        bg = sett.bkg,
      }
    end,
  }

  components.active[1][5] = {
    provider = " ",
  }

  components.active[1][6] = {
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
        icon = "   "
        return icon
      end
      return " " .. icon .. " " .. filename .. " "
    end,
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
    end,
    hl = {
      fg = sett.bkg,
      bg = sett.curr_file,
    },
    left_sep = {
      str = assets.left_semicircle,
      hl = {
        fg = sett.curr_file,
        bg = sett.bkg,
      },
    },
    right_sep = {
      str = assets.right_semicircle,
      hl = {
        fg = sett.curr_file,
        bg = sett.bkg
      }
    },
  }

  components.inactive[1][1] = {
    provider = assets.left_semicircle,
    hl = function()
      return {
        fg = clrs.black1,
        bg = clrs.black0,
      }
    end,
  }

  components.inactive[1][2] = {
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
  }

  components.inactive[1][3] = {
    provider= " NORMAL ",
    hl = {
      fg = clrs.black2,
      bg = clrs.black1,
    },
  }

  components.inactive[1][4] = {
    provider = assets.right_semicircle,
    hl = function()
      return {
        fg = clrs.black1,
        bg = clrs.black0,
      }
    end,
  }

  components.inactive[1][5] = {
    provider = " ",
    hl = {
      fg = clrs.black0,
      bg = clrs.black0,
    },
  }

  components.inactive[1][6] = {
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
        icon = "   "
        return icon
      end
      return " " .. icon .. " " .. filename .. " "
    end,
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
    end,
    hl = {
      fg = clrs.gray2,
      bg = clrs.black1,
    },
    left_sep = {
      str = assets.left_semicircle,
      hl = {
        fg = clrs.black1,
        bg = clrs.black0,
      },
    },
    right_sep = {
      str = assets.right_semicircle,
      hl = {
        fg = clrs.black1,
        -- bg = clrs.black3,
        bg = clrs.black0,
      }
    },
  }


  -- workspace loader
  components.active[3][1] = {
    provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
        local msg = Lsp.message or ""
        local percentage = Lsp.percentage or 0
        local title = Lsp.title or ""
        local spinners = {
          "",
          "",
          "",
        }
        local success_icon = {
          "",
          "",
          "",
        }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners

        if percentage >= 70 then
          return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
        end

        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
    end,
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 80
    end,
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg,
    },
  }

  -- genral diagnostics (errors, warnings. info and hints)
  components.active[3][2] = {
    provider = "diagnostic_errors",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.ERROR)
    end,

    hl = {
      fg = clrs.red,
      bg = sett.bkg,
    },
    icon = "  ",
  }

  components.active[3][3] = {
    provider = "diagnostic_warnings",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.WARN)
    end,
    hl = {
      fg = clrs.yellow,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = assets.vertical_bar_chubby,
  }

  components.active[3][4] = {
    provider = "diagnostic_info",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.INFO)
    end,
    hl = {
      fg = clrs.sky,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = assets.vertical_bar_chubby,
  }

  components.active[3][5] = {
    provider = "diagnostic_hints",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.HINT)
    end,
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = assets.vertical_bar_chubby,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      },
    },
  }

  components.active[3][6] = {
    -- provider = " ",
    provides = assets.left_semicircle,
    hl = {
      fg = clrs.black0,
      bg = clrs.black0,
    },
    -- hl = function()
    --  return {
    --    fg = sett.curr_file,
    --    bg = sett.bck
    --  }
    -- end,
    enabled = function()
      return not any_git_changes()
    end
  }

  components.active[3][7] = {
    provider = "git_branch",
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
    end,
    hl = {
      fg = clrs.gray1,
      bg = clrs.black1,
    },
    icon = " ",
    left_sep = {
      str = assets.left_semicircle,
      hl = {
        fg = clrs.black1,
        bg = clrs.black1,
      },
    },
    -- right_sep = assets.vertical_bar_chubby,
    -- right_sep = assets.vertical_bar_chubby .. assets.right_semicircle,
  }
  -- components.inactive[3][7] = {
  --  provider = "git_branch",
  --  enabled = shortline or function(winid)
  --    return vim.api.nvim_win_get_width(winid) > 70
  --  end,
  --  hl = {
  --    fg = clrs.black0,
  --    bg = clrs.black0,
  --  },
  --  icon = " ",
  --  left_sep = {
  --    str = assets.left_semicircle,
  --    hl = {
  --      fg = clrs.black0,
  --      bg = clrs.black0,
  --    }
  --  }
  -- }

  -- -- enable if git diffs are available
  components.active[3][8] = {
    -- provider = assets.right_semicircle,
    provider = "",
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
    enabled = function()
      return any_git_changes()
    end
  }
  -- -- Current vi mode ------>

  -- -- Diffs ------>
  components.active[3][9] = {
    provider = "git_diff_added",
    hl = function()
      return {
        fg = clrs.green,
        bg = clrs.black1,
      }
    end,
    icon = "  洛",
  }

  components.active[3][10] = {
    provider = "git_diff_changed",
    hl = function()
      return {
        fg = clrs.yellow,
        bg = clrs.black1,
      }
    end,
    icon = "  ~ ",
  }

  components.active[3][11] = {
    provider = "git_diff_removed",
    hl = function()
      return {
        fg = clrs.red,
        bg = clrs.black1,
      }
    end,
    icon = "   ",
    right_sep = {
      str = assets.right_semicircle,
      hl = {
        fg = clrs.black1,
        bg = clrs.black0,
      }
    },
  }

  components.active[3][12] = {
    provider = " ",
    hl = {
      fg = clrs.black1,
      bg = clrs.black0,
    }
  }




  components.inactive[3][1] = {
    provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
        local msg = Lsp.message or ""
        local percentage = Lsp.percentage or 0
        local title = Lsp.title or ""
        local spinners = {
          "",
          "",
          "",
        }
        local success_icon = {
          "",
          "",
          "",
        }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners

        if percentage >= 70 then
          return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
        end

        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
    end,
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 80
    end,
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg
    },
  }

  -- genral diagnostics (errors, warnings. info and hints)
  components.inactive[3][2] = {
    provider = "diagnostic_errors",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.ERROR)
    end,

    hl = {
      fg = clrs.red,
      bg = sett.bkg,
    },
    icon = "  ",
  }

  components.inactive[3][3] = {
    provider = "diagnostic_warnings",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.WARN)
    end,
    hl = {
      fg = clrs.yellow,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = assets.vertical_bar_chubby,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      },
    }
  }

  components.inactive[3][4] = {
    provider = "diagnostic_info",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.INFO)
    end,
    hl = {
      fg = clrs.sky,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = assets.vertical_bar_chubby,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      },
    }
  }

  components.inactive[3][5] = {
    provider = "diagnostic_hints",
    enabled = function()
      return lsp.diagnostics_exist(lsp_severity.HINT)
    end,
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = assets.vertical_bar_chubby,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    },
  }


  components.inactive[3][6] = {
    provider = " ",
    hl = {
      fg = clrs.black0,
      bg = clrs.black0,
    },
    enabled = function()
      return not any_git_changes()
    end
  }

  components.inactive[3][7] = {
    provider = "git_branch",
    enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
    end,
    hl = {
      fg = clrs.black0,
      bg = clrs.black0,
    },
    icon = " ",
    left_sep = {
      str = assets.left_semicircle,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    }
  }

  -- -- enable if git diffs are available
  components.inactive[3][8] = {
    provider = "",
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
    enabled = function()
      return any_git_changes()
    end
  }
  -- -- Current vi mode ------>

  -- -- Diffs ------>
  components.inactive[3][9] = {
    provider = "git_diff_added",
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
    icon = "  洛",
  }

  components.inactive[3][10] = {
    provider = "git_diff_changed",
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
    icon = "  ~ ",
  }

  components.inactive[3][11] = {
    provider = "git_diff_removed",
    hl = function()
      return {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    end,
    icon = "   ",
    right_sep = {
      str = assets.right_semicircle,
      hl = {
        fg = clrs.black0,
        bg = clrs.black0,
      }
    },
  }

  components.inactive[3][12] = {
    provider = " ",
    hl = {
      fg = clrs.black0,
      bg = clrs.black0,
    }
  }

    require("feline").setup({
        -- components = require('catppuccin.core.integrations.feline'),
        components = components
    })
EOF
