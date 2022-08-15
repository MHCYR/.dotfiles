set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
" set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

if (has("termguicolors"))
 set termguicolors
endif
syntax enable

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
" Tokio night theme
Plug 'folke/tokyonight.nvim'
"Comment <gcc> uncomment adjacent<gcgc>
Plug 'tpope/vim-commentary' 
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Git modifications on side bar
Plug 'lewis6991/gitsigns.nvim'
" Enable :Git command
Plug 'tpope/vim-fugitive'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" code highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" VScode extensions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"JS lint
" Plug 'dense-analysis/ale'
Plug 'eslint/eslint'
Plug 'sheerun/vim-polyglot'
" Search files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Themes
Plug 'gruvbox-community/gruvbox'
" Folder navigation
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Emmet
Plug 'mattn/emmet-vim'
" Visualize indent lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Todo Comments
Plug 'folke/todo-comments.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
call plug#end()


" THEME

let g:airline_theme = 'deus'
let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_style = 'storm'
colorscheme tokyonight

" let g:gruvbox_italic = '1'
" let g:gruvbox_italicize_strings = '1'
" let g:gruvbox_bold = '0'
" colorscheme gruvbox
" highlight Normal guibg=none

let mapleader = " "
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
inoremap jk <esc>
" Completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"NERDtree
nnoremap <Leader>b :NERDTreeToggle<CR>
" let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeShowHidden=1
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Telescope F:NERDTreeFindind files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ALE 
" Fix files automatically on save
" let g:ale_fix_on_save = 1

" Airline Theme
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" gitsigns {{{ 
lua << EOF
require('gitsigns').setup {
  current_line_blame = true
  }
EOF
" }}}


" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'html', 'javascript', 'typescript', 'tsx', 'css', 'json' },
  -- ensure_installed = "all", -- or maintained
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
 autotag = {
    enable = true,
  }
}
EOF
" }}}

" lukas-reineke/indent-blankline.nvim {{{
lua <<EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF
" }}}

" folke/todo-comments {{{
lua << EOF
require("todo-comments").setup {
    -- configs 
  }
EOF
" }}}

lua << EOF
require("nvim-autopairs").setup {}
EOF


lua << EOF
require'telescope'.load_extension('project')
require("telescope").load_extension "file_browser"
vim.api.nvim_set_keymap(
  "n",
  "<space>fj",
  ":Telescope file_browser",
  { noremap = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)
EOF
