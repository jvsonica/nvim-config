local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
    return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer...")
    vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
    -- Have packer use a popup window
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use({ "windwp/nvim-autopairs", config = get_config("nvim-autopairs") })
    use({
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = get_config("nvim-tree")
    })
    use({ "rcarriga/nvim-notify" })
    use({ "karb94/neoscroll.nvim", config = get_config("neoscroll") })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = get_config("telescope"),
    })
    use({ "jvgrootveld/telescope-zoxide" })
    use({ "crispgm/telescope-heading.nvim" })
    use({ "nvim-telescope/telescope-symbols.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope-packer.nvim" })
    use({ "nvim-telescope/telescope-ui-select.nvim" })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
            "lukas-reineke/cmp-rg",
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = get_config("cmp"),
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = get_config("lsp.lsp")
    })
    use({ "onsails/lspkind-nvim" })
    use({
        "williamboman/mason.nvim",
        requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = get_config("lsp.mason")
    })

    -- Color Scheme and Visuals
    use({ "ellisonleao/gruvbox.nvim", config = get_config("gruvbox") })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = get_config("lualine")
    })
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = get_config("bufferline")
    })
    use({ "lewis6991/gitsigns.nvim", config = get_config("gitsigns") })
end)

