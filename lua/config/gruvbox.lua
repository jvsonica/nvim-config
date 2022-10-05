-- guifg=#ebdbb2 guibg=#1d2021

local backgroundColor = "#1d2021"
local gitAddGreen = "#79740e"
local gitChangeBlue = "#076678"

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        SignColumn = {bg = backgroundColor},
        GitSignsAdd = { fg = gitAddGreen, bg = backgroundColor },
        GitSignsAddNr = { fg = gitAddGreen, bg = backgroundColor },
        GitSignsChange = { fg = gitChangeBlue, bg = backgroundColor  },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

