local vim = vim
local Plug = vim.fn['plug#']

-- undofile
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

vim.env.BAT_THEME = "base16-256"

vim.call('plug#begin', '~/.nvim/plugged')
Plug('vim-airline/vim-airline')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

Plug('ibhagwan/fzf-lua')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('simrat39/rust-tools.nvim')
-- For luasnip users.
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')

Plug('ray-x/lsp_signature.nvim')

Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/nvim-treesitter-context')
Plug('theHamsta/nvim-treesitter-pairs')

Plug('RRethy/vim-illuminate')

Plug('windwp/nvim-autopairs')
Plug('sainnhe/gruvbox-material')

-- taglist alternative
Plug('stevearc/aerial.nvim')

Plug('lewis6991/gitsigns.nvim')
Plug('tpope/vim-fugitive')
Plug('petertriho/nvim-scrollbar')
vim.call('plug#end')

require('plugins/nvim-tree')
require('plugins/nvim-cmp')
require('nvim-autopairs').setup()
require('aerial').setup()
require('plugins/treesitter')

require'treesitter-context'
require'illuminate'

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = { "*" },
  callback = function(ev)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
  end
})



require'fzf-lua'

require('gitsigns').setup()
require("scrollbar").setup({
    handle = {
        text = " ",
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = "#5c6370",
        color_nr = nil, -- cterm
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
}
)

local signature_config = {
  log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
  debug = true,
  hint_enable = false,
  handler_opts = { border = "single" },
  max_width = 80,
}

require("lsp_signature").setup(signature_config)

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.g.gruvbox_material_background = "dark"
vim.cmd('silent! colorscheme gruvbox-material')
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#504945' })

vim.g['deoplete#enable_at_startup'] = 1

-- vim settings
vim.cmd("syntax on")

-- Basic settings
vim.opt.number = true                              -- Show line numbers
vim.opt.wildmode = { "longest", "list", "full" }   -- Command-line completion mode
vim.opt.wildmenu = true                            -- Visual autocomplete for command menu
vim.opt.whichwrap:append("<,>,[,]")
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.mouse = "a"                                -- Enable mouse in all modes
-- vim.opt.textwidth = 80                           -- Uncomment to set max text width to 80

-- Tab and indentation settings
vim.opt.tabstop = 4                                -- Number of spaces for a tab
vim.opt.shiftwidth = 4                             -- Indent size for autoindents
vim.opt.autoindent = true                          -- Auto-indent new lines

-- Appearance settings
vim.opt.cursorline = true                          -- Highlight the current line

-- File encoding settings
vim.opt.fileencodings = { "utf8", "ucs-bom", "gbk", "cp936", "gb2312", "gb18030" }

-- List characters for invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }

-- Timing and search
vim.opt.updatetime = 100                           -- Faster update time for better UI responsiveness
vim.opt.hlsearch = true                            -- Highlight search matches
vim.opt.incsearch = true                           -- Incremental search

-- use space as leader key
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "FL", ":FzfLua<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "f", ":FzfLua files<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>g", ":FzfLua live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>f", ":FzfLua lgrep_curbuf<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":FzfLua buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":FzfLua grep_cword<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tt", ":AerialToggle<cr>", { noremap = true, silent = true })

vim.keymap.set("v", "<leader>c", '"+y', { noremap = true })
vim.keymap.set('n', '<C-a>c', ':%y+<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cu",
    callback = function()
        vim.bo.filetype = "c"
    end,
})

vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#fe8019', fg = '#282828', bold = true })  -- orange

