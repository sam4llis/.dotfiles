local opts

-- Angular applications.
if vim.fn.filereadable('src/app/app.module.ts') == 1 then
  opts = {
    ['src/app/'] = {
      ['*.component.html'] = {
        alternate = '{}.component.ts'
      },
      ['*.component.ts'] = {
        alternate = '{}.component.html'
      },
    },
    ['src/'] = {
      ['src/styles.css'] = {
        type = 'style'
      },
    },
    ['./'] = {
      ['tailwind.config.js'] = {
        type = 'tailwind'
      },
    },
  }
end

vim.g.projectionist_heuristics = opts
