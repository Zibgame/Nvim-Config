" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    init.vim                                            :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: zcadinot <zcadinot@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2025/10/22  by zcadinot                #+#    #+#              "
"    Updated: 2025/10/22  by zcadinot                ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" =======================
" ⚙️ Options générales
" =======================
set nocompatible
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
set termguicolors
set noshowmode
set encoding=UTF-8
set cmdheight=1
set laststatus=2
set number
set relativenumber

" =======================
" 👤 Variables personnelles
" =======================
let g:user42 = 'zcadinot'
let g:mail42 = 'zcadinot@student.42.fr'

" =======================
" 🔌 Gestionnaire de plugins (vim-plug)
" =======================
call plug#begin('~/.local/share/nvim/plugged')

" --- 🎨 Thèmes ---
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'bluz71/vim-moonfly-colors'

" --- 🧩 Icônes ---
Plug 'ryanoasis/vim-devicons'

" --- 📁 Explorateur de fichiers ---
Plug 'preservim/nerdtree'

" --- 📊 Barre de statut ---
Plug 'itchyny/lightline.vim'

" --- 🧠 Outils de code ---
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" --- 🧬 Syntaxe améliorée ---
Plug 'sheerun/vim-polyglot'

" --- 🌈 Divers utiles ---
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug '42Paris/42header'

" --- 💫 Effet fluide du curseur ---
Plug 'sphamba/smear-cursor.nvim'

" --- 🚫 Plugins désactivés (pour compatibilité) ---
" Plug 'github/copilot.vim'        " nécessite connexion GitHub + Node >= 18
" Plug 'Pocco81/TrueZen.nvim'      " dépendances visuelles + nui.nvim
" Plug 'folke/twilight.nvim'       " mode focus dépendant de Treesitter
" Plug 'junegunn/limelight.vim'    " ancien plugin, conflit avec smear-cursor
" Plug 'folke/noice.nvim'          " nécessite nui.nvim et notify
" Plug 'MunifTanjim/nui.nvim'      " dépendance complexe de noice
" Plug 'rcarriga/nvim-notify'      " pas utile sans noice

call plug#end()

" =======================
" 💫 smear-cursor (effet fluide et rapide)
" =======================
lua << EOF
require('smear_cursor').setup({
  stiffness = 0.9,              -- plus haut = plus rapide / plus net
  trailing_stiffness = 0.5,     -- moins de traînée
  distance_stop_animating = 0.02,
  update_interval = 0,
  smoothness = 0.15,            -- un petit lissage
  disable_in_insert_mode = false,
  cursor_colors = {
    normal = "#8be9fd",
    insert = "#50fa7b",
    visual = "#ffb86c",
  },
})
EOF

" =======================
" 💡 Lightline
" =======================
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ]
      \ },
      \ 'component_expand': {
      \   'gitbranch': 'fugitive#head'
      \ }
      \ }

" =======================
" 🎨 Thème par défaut
" =======================
colorscheme dracula

" =======================
" 🪄 Mappings rapides
" =======================
let mapleader = " "

" Sortie rapide du mode insert
inoremap jk <Esc>
inoremap kj <Esc>

" Arbre de fichiers
nnoremap <C-n> :NERDTreeToggle<CR>

" Sauvegarde rapide
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Undo rapide
nnoremap <C-z> :u<CR>
inoremap <C-z> <Esc>:u<CR>a

" =======================
" 🚀 EasyMotion
" =======================
nmap <Leader>f <Plug>(easymotion-bd-f)

" =======================
" 🏁 Startify
" =======================
let g:startify_custom_header = [
      \ '                                                      ',
      \ ' ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░ ',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ ' ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░',
      \ '                                                      ',
      \ '                                                      ',
      \ '      [p] Plugins       [n] NERDTree'
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Mes fichiers récents']       },
      \ { 'type': 'bookmarks', 'header': ['   Mes favoris']               },
      \ { 'type': 'sessions',  'header': ['   Mes sessions sauvegardées']},
      \ ]

nnoremap <leader>m :Startify<CR>
nnoremap <leader>p :PlugStatus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" =======================
" 🔭 Telescope keymaps
" =======================
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fo :Telescope oldfiles<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
