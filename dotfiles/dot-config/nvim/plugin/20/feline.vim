if !has("nvim-0.5.0")
    finish
endif

lua <<EOF
    require("feline").setup({
        components = require('catppuccin.core.integrations.feline'),
    })
EOF
