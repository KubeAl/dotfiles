" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" setting default python path
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" auto complete pop
Plug 'vim-scripts/AutoComplPop'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
" fzf plugin settings
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" plugin for faster code nav
Plug 'mileszs/ack.vim'
" plugin for surrounding around a text object.
Plug 'tpope/vim-surround'
" lvim kind terminal cool
Plug 'akinsho/toggleterm.nvim'
" lsp settings
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
" commenting k liye
Plug 'tpope/vim-commentary'
" sneak plugin for faster travel
Plug 'justinmk/vim-sneak'
" vim repl toggle
Plug 'sillybun/vim-repl'
" taglist
" Plug 'vim-scripts/taglist.vim'
" lightline
Plug 'itchyny/lightline.vim'
" git gutter
Plug 'airblade/vim-gitgutter'
" jedi autocompletion
Plug 'davidhalter/jedi-vim'
" installing gruvbox
Plug 'morhetz/gruvbox'
" vim fugitive
Plug 'tpope/vim-fugitive'
" vim lucious
Plug 'jonathanfilip/vim-lucius'
" vimspector
" Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
" Initialize plugin system
" vim org mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" MRU
Plug 'yegappan/mru'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
" may be a good one
call plug#end()

" basic configs
set number
set ignorecase
set mouse=a
set hlsearch
set path+=**
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
let mapleader = " "
" lsp typescript settings
" lua require("lsp-config")
" tab to Space
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" no swapfile req.
set noswapfile
" set next tab with meta
nnoremap <tab> :bNext <CR>
nnoremap <s-tab> :bprevious <CR>
 map <leader>y :NERDTreeFind<cr>
map <C-x> :Commands<CR>

" switch tabs or windows
nnoremap <D-]> :tabnext <CR>
nnoremap <D-[> :tabprevious <CR>
" for fzf finding shortcut
nnoremap <silent> <C-f> :Files<CR>
" nnoremap <silent> <C-F> :Files $HOME<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <C-h> :History<CR>
" nnoremap <C-m> :Maps<CR> " mimics enter for some reason
nnoremap <C-l> :Commands<CR>
" settings for ack with ripgrep
" ack.vim --- {{{

" Use ripgrep for searching ??????
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" adding tab navigation for easy usage
nnoremap <silent> <leader><left> :tabprevious<CR>
nnoremap <silent> <leader><right> :tabnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>] :bnext<CR>
" for better cursor position in storm of text
set cursorline
syntax on 
colorscheme desert
set complete+=kspell
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
" set clipboard=unnamedplus
set completeopt=menuone,longest
" append becomes [a] modified becomes [+] etc
set shortmess+=c
set shell=/bin/zsh 
" for vim settings::: added after vim is here
map <leader>nt :NERDTreeToggle<CR>
nnoremap <D-\> :NERDTreeToggle<CR>
" terminal settings
" set termwinsize=10*0
map <leader>t :ToggleTerm direction=horizontal<CR>
map <C-t> :ToggleTerm direction=float<CR>
tmap <C-t> <C-\><C-n>:ToggleTerm<CR>
tmap <C-x> <C-\><C-n>
map <leader>\ :MRU <CR>
tnoremap <C-q> <C-w>:q!<CR>
" this is the sneak bindings
map f <Plug>Sneak_s
map F <Plug>Sneak_S
noremap ` <C-w>
" vim repl settings
nnoremap <leader>r :REPLToggle<CR>
let g:repl_position = 0
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   'vim': 'vim -e',
            \   }
" for lightline in vim
set laststatus=2
" vim switch buffer even unsaved one
set hidden
" enable disable autoindent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>
" jedi vim settings
let g:jedi#goto_command = "<leader>D"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = "D"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>z"
" important for not loading everything when not required
let g:jedi#popup_on_dot = 0 
let g:jedi#show_call_signatures = "2"
" change working directory to current file on the fly
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <C-=> :TlistToggle<CR>
" debugger with F5
" nnoremap <leader>dd :tab ter python -m pudb %<CR>
" Debugger remaps
"nnoremap <leader>m :MaximizerToggle!<CR>
"nnoremap <leader>dd :call vimspector#Launch()<CR>
"nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
"nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
"nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
"nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
"nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
"nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
"nnoremap <leader>de :call vimspector#Reset()<CR>

"nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

"nmap <leader>dl <Plug>VimspectorStepInto
"nmap <leader>dj <Plug>VimspectorStepOver
"nmap <leader>dk <Plug>VimspectorStepOut
"nmap <leader>d_ <Plug>VimspectorRestart
"nnoremap <leader>d<space> :call vimspector#Continue()<CR>

"nmap <leader>drc <Plug>VimspectorRunToCursor
"nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
"nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
"nmap <leader>di <Plug>VimspectorBalloonEval
"xmap <leader>di <Plug>VimspectorBalloonEval



" javascript formatting
" autocmd FileType javascript setlocal formatprg=js-beautify\ --stdin
autocmd bufwritepost *.js silent !standard % --format
set autoread
" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
" **********************************************************custom function
