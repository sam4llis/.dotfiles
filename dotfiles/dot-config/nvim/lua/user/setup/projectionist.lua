local opts

-- Angular applications.
if vim.fn.filereadable('angular.json') == 1 then
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
      ['.gitignore'] = {
        type = 'gitignore'
      },
      ['package.json'] = {
        type = 'package'
      },
      ['tailwind.config.js'] = {
        type = 'tailwind'
      },
    },
  }
end

-- NestJS applications.
if vim.fn.filereadable('nest-cli.json') == 1 then
  opts = {
    ['src/'] = {
      ['*.controller.ts'] = {
        alternate = '{}.service.ts'
      },
      ['*.service.ts'] = {
        alternate = '{}.controller.ts'
      },
    },
    ['./'] = {
      ['.gitignore'] = {
        type = 'gitignore'
      },
      ['package.json'] = {
        type = 'package'
      },
    },
  }
end

vim.g.projectionist_heuristics = opts
