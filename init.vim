set rtp+=C:\Users\chris\AppData\Local\nvim

call plug#begin('C:\Users\chris\AppData\Local\nvim\plugged')

Plug 'folke/lazy.nvim'

lua <<EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local chatgpt_config  = {
        api_key_cmd= "openssl enc -in C:\\Users\\chris\\AppData\\Local\\nvim\\openai.secret -d -pbkdf2 -k symmetrickey",
        -- api_host_cmd="echo 10.1.0.1:31416",
        -- extra_curl_params = { "--cacert","/home/vainamietzsche/.ssh/api.openai.com+3.pem"},
        openai_params = {
                model = "gpt-3.5-turbo",
                frequency_penalty = 0,
                presence_penalty = 0,
                max_tokens = 1500,
                temperature = 0,
                top_p = 1,
                n = 1,
        }
        }


require("lazy").setup ({"nvim-lua/plenary.nvim","kabouzeid/nvim-lspinstall", "dgagn/diagflow.nvim", 'jvgrootveld/telescope-zoxide',
"ggandor/leap.nvim",
'kdheepak/lazygit.nvim',
"vim-syntastic/syntastic",
"HiPhish/rainbow-delimiters.nvim" ,
"RRethy/vim-hexokinase",
"m4xshen/autoclose.nvim",
'nvim-lua/plenary.nvim',
'voldikss/vim-floaterm',
  'dawsers/telescope-floaterm.nvim',
  'jvgrootveld/telescope-zoxide',
  'nanotee/zoxide.vim',
"axelf4/vim-strip-trailing-whitespace" ,
"hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp",
"sindrets/diffview.nvim","Olical/nvim-local-fennel", 'Olical/aniseed' ,
"neovim/nvim-lspconfig","lewis6991/gitsigns.nvim",
"voldikss/vim-floaterm",'hrsh7th/cmp-buffer'  , 'hrsh7th/cmp-path' ,"hrsh7th/cmp-cmdline" ,'hrsh7th/nvim-cmp',
{"nvim-telescope/telescope-project.nvim", dependencies={"nvim-telescope/telescope.nvim"}},  {"nvim-telescope/telescope-fzy-native.nvim",  dependencies={"nvim-telescope/telescope.nvim"}},
{"VonHeikemen/fine-cmdline.nvim", dependencies={"MunifTanjim/nui.nvim"}},
{"VonHeikemen/searchbox.nvim", dependencies={"MunifTanjim/nui.nvim"}}, 
{ 'nvim-treesitter/nvim-treesitter',  cmd="TSUpdate"}, "nvim-treesitter/nvim-treesitter-textobjects",
 {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},

 {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(chatgpt_config)
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
} ,

 {
                 "numToStr/Comment.nvim",
                 opts =

                 {
                                 ---Add a space b/w comment and the line
                                 padding = true,
                                 ---Whether the cursor should stay at its position
                                 sticky = true,
                                 ---Lines to be ignored while (un)comment
                                 ignore = nil,
                                 ---LHS of toggle mappings in NORMAL mode
                                 toggler = {
                                         ---Line-comment toggle keymap
                                         line = 'gcc',
                                         ---Block-comment toggle keymap
                                         block = 'gbc',
                                 },
                                 ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                                 opleader = {
                                         ---Line-comment keymap
                                         line = 'gc',
                                         ---Block-comment keymap
                                         block = 'gb',
                                 },
                                 ---LHS of extra mappings
                                 extra = {
                                         ---Add comment on the line above
                                         above = 'gcO',
                                         ---Add comment on the line below
                                         below = 'gco',
                                         ---Add comment at the end of line
                                         eol = 'gcA',
                                 },
                                 ---Enable keybindings
                                 ---NOTE: If given `false` then the plugin won't create any mappings
                                 mappings = {
                                         ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                                         basic = true,
                                         ---Extra mapping; `gco`, `gcO`, `gcA`
                                         extra = true,
                                 },
                                 ---Function to call before (un)comment
                                 pre_hook = nil,
                                 ---Function to call after (un)comment
                                 post_hook = nil,
                                 } ,
                 lazy = false,
                 },
 {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",  -- Use the latest tagged version
  opts = {},  -- This causes the plugin setup function to be called
  keys = {
    {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}},
    {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}},
    {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}},
    {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}},
    {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
    {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}},
  },
}

});
 require('leap').create_default_mappings()
require("autoclose").setup()
local rainbow_delimiters = require("rainbow-delimiters" )

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}


  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = { experimental = { ghost_text = false },
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      },
    mapping = cmp.mapping.preset.insert({

    ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                    cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
            elseif has_words_before() then
                    cmp.complete()
            else
                    fallback()
                    end
                    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                    cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
            else
                    fallback()
                    end
                    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    }, {
            { name = 'buffer' },
    })
    })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clojure_lsp'].setup {
          capabilities = capabilities
  }

-- Set up telescope projects
require'telescope'.load_extension('project')
require("telescope").load_extension('zoxide')
vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)

vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "text",
            priority = 0,
            selector = 'textarea:not([rows="1"])' ,
            takeover = "always"
        }
    }
}



require('diagflow').setup({
    enable = true,
    max_width = 60,  -- The maximum width of the diagnostic messages
    max_height = 10, -- the maximum height per diagnostics
    severity_colors = {  -- The highlight groups to use for each diagnostic severity level
        error = "DiagnosticFloatingError",
        warning = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
    },
    format = function(diagnostic)
      return diagnostic.message
    end,
    gap_size = 1,
    scope = 'cursor', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
    padding_top = 2,
    padding_right = 7,
    text_align = 'right', -- 'left', 'right'
    placement = 'top', -- 'top', 'inline'
    inline_padding_left = 0, -- the padding left when the placement is inline
    update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
    toggle_event = { }, -- if InsertEnter, can toggle the diagnostics on inserts
    show_sign = false, -- set to true if you want to render the diagnostic sign before the diagnostic message
    render_event = { 'DiagnosticChanged', 'CursorMoved' },
    border_chars = {
      top_left = "┌",
      top_right = "┐",
      bottom_left = "└",
      bottom_right = "┘",
      horizontal = "─",
      vertical = "│"
    },
    show_borders = false,
})


require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end

};


vim.keymap.set('n', '/', ':SearchBoxIncSearch<CR>')

vim.keymap.set('n', '?', ':SearchBoxIncSearch reverse=true<CR>')


EOF
""     '


Plug 'ahmedkhalf/project.nvim'



"Git integrations

"Public

Plug 'Olical/nvim-local-fennel'
Plug 'Olical/aniseed'





Plug 'rhysd/vim-grammarous'
Plug 'ntpeters/vim-better-whitespace'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-tree/nvim-web-devicons'

Plug 'bling/vim-bufferline'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'vimlab/split-term.vim'
Plug 'marko-cerovac/material.nvim'

Plug 'powerman/vim-plugin-AnsiEsc'


Plug  'RRethy/vim-hexokinase'

Plug 'roxma/vim-tmux-clipboard'
Plug 'roxma/nvim-yarp'

Plug 'lambdalisue/suda.vim'
"Activity tracking
"Plug 'wakatime/vim-wakatime'
"Plug 'ActivityWatch/aw-watcher-vim'






Plug 'jiangmiao/auto-pairs'

Plug 'norcalli/nvim-terminal.lua'


Plug 'ionide/Ionide-vim', {
      \ 'do':  'make fsautocomplete',
      \}
Plug 'pest-parser/pest.vim'

Plug 'tpope/vim-dispatch'

Plug 'lervag/vimtex'
Plug 'Olical/conjure' , { 'branch': 'develop' }
Plug 'guns/vim-clojure-static'
" Plug 'luochen1990/rainbow'
Plug 'guns/vim-clojure-highlight'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release'}
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/twilight'

Plug 'vim-scripts/phd'
Plug 'junegunn/seoul256.vim'
Plug 'mkarmona/colorsbox'
Plug 'sheerun/vim-wombat-scheme'
Plug 'twerth/ir_black'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" Formater
Plug 'stevearc/conform.nvim'

Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'jnurmine/Zenburn'
Plug 'savq/melange-nvim'
Plug 'romainl/Apprentice'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'
Plug 'dylon/vim-antlr'
Plug 'hellerve/carp-vim'
Plug 'nanotee/sqls.nvim'



"Vim sneak like
Plug 'folke/flash.nvim'

"Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'owickstrom/neovim-ghci'

"Kotlin
Plug 'udalov/kotlin-vim'

Plug 'nvim-lua/popup.nvim'

"Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'

"floating
Plug 'hood/popui.nvim'

"common lisp
Plug  'vlime/vlime', {'rtp': 'vim/'}

" Ghost text
" Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" Vim jack int
Plug 'tpope/vim-dispatch'
" Plug 'clojure-vim/vim-jack-in'
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

Plug 'mfussenegger/nvim-lint'

"vim history
Plug 'simnalamburt/vim-mundo'


Plug '\'

call plug#end()


let g:aniseed#env = v:true

let g:floaterm_width  = 0.9

let g:floaterm_height = 0.9


" Markdown
let vim_markdown_preview_hotkey='<C-m>'

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c


"Max characters per line
set cc=80

"Font
" set guifont=Monaco:h18
set mouse=c
" Space Mono
" Many settings

set autochdir
set expandtab
set hidden
set notimeout
set noswapfile
set nowritebackup
set nowrap
set nofoldenable "disable folding
set lazyredraw
set expandtab           " Insert spaces when TAB is pressed.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set noshowmode
set modeline
set ruler "show the ruler line
"set background=dark
set cursorline "show cursorline
set backspace=indent,eol,start
set laststatus=2
set clipboard=unnamedplus "default register is clipboard register
set wildmode=longest:full "cmdline full name on tba completion
set wildignorecase "make cmdline completion ignore case
set textwidth=0    " Hard-wrap long lines as you type them.
set signcolumn=yes
set scrolloff=8   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5
set nocompatible

set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
"
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


set hlsearch
let g:incsearch#auto_nohlsearch = 1

autocmd FocusGained * checktime

" For regular expressions turn magic on
set magic


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.

" Set hybrid togle line numbers
set number norelativenumber

"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
"  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
"augroup END
"
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END



" Undo file
" set undofile
" set undodir=~/.vim/undo


"Enable completion

filetype plugin on
syntax enable

let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#enable_smart_case = 1
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#complete_method='complete'

"Preview autocomplete
set completeopt-=preview

set completeopt=longest,menuone
"set formatoptions-=tc


nmap <M-=> :vertical resize +2<CR>
nmap <M--> :vertical resize -2<CR>
nmap + :resize +2<CR>
nmap - :resize -2<CR>

"Move throught splits


nnoremap <SPACE> <Nop>
nnoremap Q <Nop>

let mapleader=" "

let maplocalleader=" "

"Easier emmet vim
map <leader>, <C-y>,


"Open html files in chrome
nnoremap <F5> :update<Bar>silent !xdg-open %:p &<CR>

"Paste while in terminal with <C-R>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"use escape to switch to normal mode in terminal
tnoremap <esc> <C-\><C-N>



nnoremap ,n :bnext<CR>
nnoremap ,p :bprevious<CR>
" nnoremap gk   <C-o>
" nnoremap gj   <C-i>




"Colorizer
let g:colorizer_maxlines=1000


"Clojure check
let g:neomake_clojure_enabled_makers = ['check']


set virtualedit=all


"User defined functions


"Show parinfer modes in airline
"
"

"
if (exists('g:parinfer_airline_integration') ? g:parinfer_airline_integration : 1)
  function! ParinferAirline(...)
    if &filetype =~ '.*\(clojure\|scheme\|lisp\|hy\).*'
      let w:airline_section_a = g:airline_section_a . ' %{g:parinfer_mode}'
    endif
  endfunction
  try
    call airline#add_statusline_func('ParinferAirline')
  catch
  endtry
endif


" Use local perl to handle substitution
" Invoke via :S/pattern/replace/flags
function s:Substitute(line1, line2, sstring)
  let l:lines=getline(a:line1, a:line2)
  " Call perl using utf8.  #line etc makes error messages prettier
  let l:sysresult=system("perl -e 'use utf8;' -e '#line 1 \"perl substitution\"' -pe ".
        \shellescape("s".escape(a:sstring,"%!").";"), l:lines)
  if v:shell_error
    echo l:sysresult
    return
  endif
  let l:result=split(l:sysresult, "\n", 1)  " 1: don't drop blank lines
  " delete lines but don't put in register:
  execute a:line1.",".a:line2." normal \"_dd"
  call append(a:line1-1, l:result)  " add lines
  call cursor(a:line1, 1)  " back to starting place
  if a:line1 == a:line2
    echom "Substitution on line" a:line1
  else
    echom "Substitution on lines" a:line1 "to" a:line2
  endif
endfunction


command -range=% -nargs=* S <line1>,<line2>!perl -p -e  <args>

command -range=% -nargs=* Ss <line1>,<line2>!sregx  <args>

command -range=% -nargs=* Sp execute "normal mp" | <line1>,<line2>!perl -p -e  <args> | execute 'normal `p'

command -range -nargs=1 S1 call s:Substitute(<line1>, <line2>, <q-args>)


function ParinferToggleMode()
  if  g:parinfer_mode  == "smart"
    let g:parinfer_mode = "indent"
  elseif  g:parinfer_mode  == "indent"
    let g:parinfer_mode = "insert"
  elseif  g:parinfer_mode  == "insert"
    let g:parinfer_mode = "off"
  else
    let g:parinfer_mode = "smart"
  endif
  echo "Mode is now : " g:parinfer_mode
endfunction

nnoremap ,P :call ParinferToggleMode()<CR>

nnoremap ,r :call RooterToggle()<CR>

highlight g1 guibg='#3EA055'

highlight g2 guibg=#FFF380

highlight g3 guibg=#737CA1


set completeopt=noinsert,menuone,noselect



" Or map each action separately
"better white space

let g:better_whitespace_ctermcolor='green'
let g:better_whitespace_guicolor='green'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0





"Syntastic


 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 set statusline+=%F

 let g:syntastic_always_populate_loc_list = 0
 let g:syntastic_auto_loc_list = 0
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0


"  let g:syntastic_loc_list_height = 0

"  let g:syntastic_clojure_checkers =['joker']

autocmd BufNewFile,BufRead *.joke set syntax=clojure


filetype plugin on

set completeopt=noinsert,menuone,noselect


inoremap <c-c> <ESC>

let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file",]


command!  ConjureNreplDotConnect execute "ConjureConnect " . system("cat " . FindRootDirectory() .  "/.nrepl-port")
command!  ConjureShadowReplDotConnect execute "ConjureConnect " . system("cat " . FindRootDirectory() .  "/.shadow-cljs/nrepl.port")

nnoremap   <silent>   <leader>cn   :ConjureShadowReplDotConnect<CR>


"command! Cd execute ":ConjureCljDebugInit"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! Expand(exp) abort
    let l:result = expand(a:exp)
    return l:result ==# '' ? '' : "file://" . l:result
endfunction


" Transparent floating windows
set pumblend=10
hi PmenuSel blend=0




"let g:conjure_config = {"log.hud.enabled?": v:false}`
let g:AutoPairsShortcutToggle = ',a'

augroup filetypedetect
 au BufRead,BufNewFile *.mustache set filetype=html
 au BufRead,BufNewFile *.dst set filetype=clojure
"  au BufRead,BufNewFile *.rkt set filetype=racket

 au BufRead,BufNewFile *.kts set filetype=kotlin

au Filetype clojure let g:AutoPairs = {}
au Filetype lisp let g:AutoPairs = {}

function! GetNreplPort()

endfunction




 " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


    " enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

highlight Comment ctermfg=green guifg=#905724


let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='clojure,css,html'
let g:colorizer_disable_bufleave = 1





" colorscheme jellybeans
" colorscheme zenburn
" colorscheme nord
" colorscheme material
"colorscheme tender
colorscheme melange
"au ColorScheme * hi Normal ctermgb=
hi Normal guibg=grey19

set expandtab
vmap ,x :!tidy -q -i --show-errors 0<CR>





command! Fj  :%!jq .

command! Today :r!echo $(date +\%A\%t\%m\%t\%Y)

let g:ctrlp_open_multiple_files = '1r'

"Airline
let g:airline#extensions#tabline#enabled = 1
let g:base16_airline=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" AirLine Theme
let g:airline_theme = 'tender'
let g:airline_left_sep='>'
let g:airline_theme='badwolf'




highlight Cursor guifg=white guibg= steelblue
highlight iCursor guifg=white guibg= #DECAB0
highlight CursorLine  ctermbg=black  guibg=#2B1B17
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

let g:rainbow_active = 1
let g:clojure_fuzzy_indent=1
let g:clojure_align_multiline_strings = 1



cnoreabbrev Prl  %!perl -pi -e

cnoreabbrev Prl1  !perl -pi -e

set laststatus=0

command! Sh :ConjureShadowSelect app


" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
let g:LanguageClient_autoStart = 1



dig l;         0955


let  g:AutoPairs= {'(':')', '[':']', '{':'}','"':'"',  '```':'```', '"""':'"""', "'''":"'''" }




let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
\ 'zig': ['zls'],
\ }


highlight Conceal ctermfg=77

highlight SpellBad ctermfg=224   ctermbg='NONE' gui=underline guibg='NONE' guisp=Red

set conceallevel=0

"lua << EOF
"
"local neogit = require('neogit')
"neogit.setup {}
"
"EOF


lua <<EOF





local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

EOF


lua << EOF




require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"clojure", "lua", "rust",  "java",  "kotlin", "zig"}  ,

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {  },

    additional_vim_regex_highlighting = false,
  },
}
EOF

" let  g:conjure#client#racket#stdio#command = "racket -I axe"


let g:vimtex_view_method = 'zathura'

let g:syntastic_tex_checkers = ['lacheck']

lua <<EOF
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

 -- these are all the default values


EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>



autocmd BufNewFile,BufRead *.rkt let g:conjure#log#hud#enabled = v:false

autocmd BufNewFile,BufRead *.rkt let g:conjure#log#trim#to = 100

let g:conjure#log#jump_to_latest#enabled = v:true



augroup ConjureLog
  au! BufRead,BufNewFile,BufEnter conjure-log-*.* exe "resize " . (winheight(0) * 3/7)
augroup END


for i in range(65,90)
        let c= nr2char(i)
        execute 'inoremap    ,,' . c . ' ' .  '<c-k>'  . '*' .  c  . ' '
        execute 'inoremap    ,,' . tolower(c)  . ' ' .  '<c-k>'  . '*' .  tolower(c)   . ' '
endfor


let g:conjure#log#trim#to = 500
let g:conjure#log#trim#at = 100


let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]

" 🐓 Coq completion settings
"
 " Set recommended to false
"  let g:coq_settings = { "keymap.recommended": v:false,"display.pum.fast_close": v:false  }


" let g:coq_settings = { "keymap.recommended": v:false}


 " Keybindings
"ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
"ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
"ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
"ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
"ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
"ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"



" sbcl --eval '(load #P"~/.quicklisp/setup.lisp")' --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)'

lua <<EOF
require('rust-tools').setup({})
EOF

let g:conjure#filetypes = ['clojure', 'fennel', 'janet', 'hy', 'racket', 'scheme', 'lua']





augroup LocalVlimeKeys
    autocmd!
     autocmd FileType lisp nnoremap <silent> <buffer> <Leader>ee
         \ :call vlime#plugin#SendToREPL(vlime#ui#CurExprOrAtom())<cr>

augroup end


        let g:vlime_window_settings = {
                \ "sldb": {
                    \ "pos": "botright",
                    \ "size": 15,
                    \ "vertical": v:true
                \ },
                \ "server": {  "size" : 10 },
                \ "repl" : { -> {"pos": "belowright", "size": winheight(".") / 5}} ,
                \ }



highlight clear SpellBad
highlight SpellBad ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

let g:zprint#options_map = '{:search-config? false :style :indent-only}'

let g:zprint#make_autocmd = v:true

let g:grammarous#use_vim_spelllang  = 1

let g:cssColorVimDoNotMessMyUpdatetime = 1

set termguicolors


lua <<EOF

require('lint').linters_by_ft = {
  clojure = {'clj-kondo',}
}

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

EOF

" au BufWritePost lua require('lint').try_lint()

map <leader>m <Nop>


lua <<EOF

if vim.g.started_by_firenvim == true then
 vim.g.firenvim_config.localSettings['.*'] = {selector = 'textarea:not([rows="4"]):not([rows="2"]):not([rows="1"]):not([rows="0"]), textarea:not([type=search])' }
end


require("conform").setup({
  formatters_by_ft = {
    -- lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
     -- javascript = { { "prettierd", "prettier" } },
    clojure = { "zprint"  },
  },
})


require('lualine').setup()
EOF





command -range=% -nargs=* Floatermkoggle execute "FloatermKill" |  execute "FloatermToggle"

nnoremap   <silent>   <leader>tf    :FloatermNew  --height=0.9 --width=0.9<CR>
tnoremap   <silent>   <leader>tf    <C-\><C-n>:FloatermNew  --height=0.9 --width=0.9<CR>
nnoremap   <silent>   <leader>tp    :FloatermPrev<CR>
tnoremap   <silent>   <leader>tp    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tn    :FloatermNext<CR>
tnoremap   <silent>   <leader>tn    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader>tt    :FloatermToggle<CR>
tnoremap   <silent>   <leader>tt    <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <leader>tk    :Floatermkoggle <C>
tnoremap   <silent>   <leader>tk    <C-\><C-n>:Floatermkoggle<C>
nnoremap   <silent>   <leader>tx    :FloatermKill<C>
tnoremap   <silent>   <leader>tx    <C-\><C-n>:FloatermKill<C>
nnoremap   <silent>   <leader>tl    :Telescope floaterm<CR>
tnoremap   <silent>   <leader>tl    <C-\><C-n>:Telescope floaterm<CR>
nnoremap   <silent>   <leader>ts    :FloatermSend<CR>

tnoremap   <silent>   <leader>tu   <C-\><C-n>:FloatermNew   --height=0.9 --width=0.9  gitui<CR>
nnoremap   <silent>   <leader>tu    :FloatermNew   --height=0.9 --width=0.9  gitui<CR>

nnoremap   <silent>   <leader>tg    :FloatermNew  --height=0.9 --width=0.9 lazygit<CR>
tnoremap   <silent>   <leader>tg    <C-\><C-n>:FloatermNew  --height=0.9 --width=0.9 lazygit<CR>







" if executable('fzf')
"
" "FZF line search
" nnoremap <silent> ,r :Rg<cr>
"
" "FZF search files
" nnoremap <silent> ,f :FZF  --reverse <cr>
"
" " FZF for open buffers
"   nnoremap <silent> ,b :Buffers<cr>
"
" " FZF for MRU
"   nnoremap <silent> ,m :History<cr>
"
" " Use fuzzy completion relative filepaths across directory
"   imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
"
" " Better command history with q:
"   command! CmdHist call fzf#vim#command_history({'right': '40'})
"   nnoremap q: :CmdHist<CR>
"
" " Better search history
"   command! QHist call fzf#vim#search_history({'right': '40'})
"   nnoremap q/ :QHist<CR>
"
"   command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
"
"  nmap ,<tab> <plug>(fzf-maps-n)
"
"
" end
"



" function! Cc()
"   let buffers = map(copy(getbufinfo()), 'v:val.bufnr')
"   for bf in buffers
"     let l:cnlog = bufname(bf)
"     let matchs = matchstr(l:cnlog, ".*njure-log.*")
"     if matchs == ''
"     else
"       let l:bufnr = bufnr('')
"        execute 'noautocmd keepalt buffer' bf
"        execute  'ColorHighlight'
"        execute 'noautocmd keepalt buffer' l:bufnr
"     endif
"   endfor
" endfunction

"Dependencies

" nnoremap s <Nop>
" nnoremap S <Nop>
