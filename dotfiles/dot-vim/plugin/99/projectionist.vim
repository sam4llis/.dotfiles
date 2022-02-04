if filereadable('src/app/app.module.ts')
  " Angular Application.
  let g:projectionist_heuristics = {
        \ "src/app/": {
        \   "*.component.html": { "alternate": "{}.component.ts" },
        \   "*.component.ts":   { "alternate": "{}.component.html" },
        \ },
        \ "src/": {
        \   "src/styles.css": { "type": "style" },
        \ },
        \ "./": {
        \   "tailwind.config.js": { "type": "tailwind" },
        \ },
        \ }
endif
