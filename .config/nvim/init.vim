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
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Emmet
Plug 'mattn/emmet-vim'
" Visualize indent lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Todo Comments
Plug 'folke/todo-comments.nvim'
" auto identation on open brackets
Plug 'windwp/nvim-autopairs'
"Auto closing tags
Plug 'windwp/nvim-ts-autotag'
" Manage multiple projects
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
call plug#end()


" THEME

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
" These commands will navigate through buffers in order regardless of which mode you are using
nnoremap <silent><Leader>bn :BufferLineCycleNext<CR>
nnoremap <silent><Leader>bp :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
" nnoremap <silent><mymap> :BufferLineMoveNext<CR>
" nnoremap <silent><mymap> :BufferLineMovePrev<CR>

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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" windwp/nvim-autopairs
" {{{
lua << EOF
require("nvim-autopairs").setup {}
EOF
" }}}

" nvim-telescope/telescope.nvim
" {{{
lua << EOF
require('telescope').setup {
  pickers = {
    find_files = {
      search_dirs = {'./', './components'}
      }
  },
  extensions = {
    project = {
      hidden_files = true, -- default: false
      theme = "dropdown"
    },
    file_browser = {
        -- hidden = true
      search_dirs = {'./', './components'},
      respect_gitignore = false
    }
  }
}
require'telescope'.load_extension('project')
require("telescope").load_extension "file_browser"
-- File control
vim.api.nvim_set_keymap(
  "n",
  "<space>fc",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
-- Project control
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)
EOF
" }}}

" kyazdani42/nvim-web-devicons
" {{{
lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF
" }}}

" nvim-lualine/lualine.nvim {{{
lua << END
require('lualine').setup()
END
" }}}

" akinsho/bufferline.nvim {{{
lua << EOF
require("bufferline").setup{
  options = {
    separator_style = "slant"
  }
}
EOF
" }}}
