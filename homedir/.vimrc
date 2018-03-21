"Setting the tabs to spaces and to auto tabs
set exrc
set tabstop=4 expandtab shiftwidth=4 smartindent
set number
set ruler
colo evening 
set tags=tags
set splitbelow
set nobackup nowritebackup noswapfile
syntax on
set hlsearch
filetype indent on
filetype plugin indent on
set completeopt-=preview "Shuts the preview window in omny autocomplete off

" Variables and constants
let g:VIMFILESDIR="~/.vim/"

highlight Comment ctermfg=darkgray
hi MatchParen cterm=bold ctermbg=darkgray ctermfg=6

" Maps 
let mapleader= ":"

noremap <C-p> <leader>bprevious <cr>
noremap <S-p> <leader>bnext <cr>
noremap <C-D> <leader>bdelete! <cr>
noremap <C-d> <leader>bdelete <cr>
noremap <C-e> <leader>Phplint <cr>
noremap <C-k> 0i//<ESC><cr>0
noremap <S-k> 0xx<cr>0
noremap <C-a> ggVG
noremap <C-b> Vyp
noremap <C-l> :set hlsearch <cr>
noremap <S-s> :nohlsearch <cr>
noremap <leader>v p
noremap <S-t> gT
noremap <S-T> gt
noremap <C-t> <leader>Texplore <cr>
noremap <leader>c :Findclass <C-R><C-W><cr>
noremap <leader>C :Openclass <C-R><C-W><cr>
noremap <leader>u :FindUsage <C-R><C-W><cr>
noremap <leader>y :FindUsageFiles <C-R><C-W><cr>
noremap <leader>U :OpenUsageFiles <C-R><C-W><cr>
noremap <leader>8 :global/\c<C-R><C-W>/print<cr>

" Change selection to uppercase
vnoremap <leader>u U 
vnoremap <leader>c y

inoremap <leader>w <ESC><leader>w<cr>
inoremap <leader>a <ESC><leader>w<cr>A
inoremap <leader>v <ESC>V
inoremap <leader>d <ESC>dd
inoremap <leader>y <ESC>Vy
inoremap <leader>b <ESC>VypA
inoremap <leader>e <ESC><Right>
inoremap <leader>c <ESC><Right>C
inoremap <leader>> <C-x><C-o>
inoremap <leader>? <C-n>
inoremap <leader># <ESC>0i#<ESC><leader>w<cr>A
inoremap <leader>l <ESC><leader>w<cr><leader>Lint<cr>

"Abbreviations (acts like snippets)
iabbrev /*** /**<cr>*<cr>*/<UP>
iabbrev /@@ /** @var */<LEFT><LEFT><LEFT>
iabbrev privatef private function(){}<LEFT><LEFT><LEFT><LEFT>
iabbrev publicf public function(){}<LEFT><LEFT><LEFT><LEFT>
iabbrev protectedf protected function(){}<LEFT><LEFT><LEFT><LEFT>
iabbrev pub public ;<LEFT>
iabbrev pri private ;<LEFT>
iabbrev pro protected ;<LEFT>
iabbrev var_ var_dump();<LEFT><LEFT>
iabbrev if( if () {}<LEFT><LEFT><LEFT><LEFT>
iabbrev <? <?php<cr>
iabbrev FireE FireEngine\ <ESC>xA
iabbrev ret return
iabbrev WebTestCase Symfony\Bundle\FrameworkBundle\Test\WebTestCase
iabbrev get_class_methods var_dump(get_class_methods());<Left><Left><Left>

"Omy completion setting.
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \   setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

" Shell commands in new window.
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let expanded_cmdline = a:cmdline
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd Lint call s:LintPhpCommand()
function! s:LintPhpCommand()
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read ! php -l #'
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ Findclass call s:FindClassCommand(<q-args>)
function! s:FindClassCommand(className)
    below new
    execute 'silent $read ! findclass '. a:className . ' .' 
    execute 'redraw'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ Openclass call s:OpenClassCommand(<q-args>)
function s:OpenClassCommand(className)
    execute '! findclass '. a:className .' . --open'
    1
endfunctio


command! -complete=shellcmd -nargs=+ FindUsage call s:FindUsageCommand(<q-args>)
function! s:FindUsageCommand(entity)
    below new
    execute 'silent $read ! findusage '. a:entity . ' ' . expand("%:p:h")
    execute 'redraw'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ FindUsageFiles call s:FindUsageFilesCommand(<q-args>)
function! s:FindUsageFilesCommand(entity)
    below new
    execute 'silent $read ! findusage '. a:entity . ' ' . expand("%:p:h") ' --short' 
    execute 'redraw'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ OpenUsageFiles call s:OpenUsageFilesCommand(<q-args>)
function! s:OpenUsageFilesCommand(entity)
    execute '! findusage '. a:entity . ' ' . expand("%:p:h") ' --open' 
    1
endfunction

command! -complete=file -nargs=1 Load call s:LoadTemplate(<q-args>)
function! s:LoadTemplate(type)
    execute ':read ~/.vim/templates/'.a:type.'.php'
    execute 'normal ggdd'
    execute ":% s/<<classname>>/".expand("%:t")."/g"
    execute ':% s/\.php//g'
    execute 'normal gg'
    1
endfunction

command! -complete=command -nargs=0 LoadTags call s:LoadCTags()
function! s:LoadCTags()
    execute ':! ctags-exuberant -R -f tags ./'
    execute ':set tags=tags'
    1
endfunction

" Add PHP class autoload
au FileType php nnoremap gf :call composer#open_file#open(expand('<cword>'))<CR>

if has("python3")
    py3file ~/.vim/plugin/findclass.py

    noremap <leader>v :python3 findInPath()<cr>
    noremap <leader>V :python3 openFoundInPath()<cr>
endif

