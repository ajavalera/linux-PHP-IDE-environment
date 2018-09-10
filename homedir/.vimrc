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
hi Search cterm=NONE ctermfg=white ctermbg=blue
filetype indent on
filetype plugin indent on
set completeopt-=preview "Shuts the preview window in omny autocomplete off

" Variables and constants
let g:VIMFILESDIR="~/.vim/"

highlight Comment ctermfg=blue
hi MatchParen cterm=bold ctermbg=black ctermfg=white

" Maps 
let mapleader= ":"

noremap <C-p> <leader>bprevious <cr>
noremap <S-p> <leader>bnext <cr>
noremap <C-D> <leader>bdelete! <cr>
noremap <C-d> <leader>bdelete <cr>
noremap <C-a> ggVG
noremap <C-b> Vyp
noremap <C-l> :set hlsearch <cr>
noremap <S-s> :nohlsearch <cr>
noremap <leader>v p
noremap <S-t> gT
noremap <S-T> gt
noremap <C-t> <leader>Texplore <cr>
noremap <leader>fc :Findclass <C-R><C-W><cr>
noremap <leader>oc :Openclass <C-R><C-W><cr>
noremap <leader>fu :Findusage <C-R><C-W><cr>
noremap <leader>fuf :Findusagefiles <C-R><C-W><cr>
noremap <leader>ff :Findfile <C-R><C-W> ./<cr>
noremap <leader>ouf :Openusagefiles <C-R><C-W><cr>
noremap <leader>find :global/\c<C-R><C-W>/print<cr>
noremap <leader>ll :w<cr>:Lint<cr>
noremap <leader>mm <C-w><C-w><C-w>200+
noremap <leader>c 0i//<ESC><cr>0
noremap <leader>C 0xx<cr>0
noremap <leader>func :g/function/p<cr>
noremap <leader>goto /function <c-r><c-w><cr>

"Open php file path in current window and expand the window 250 units.
noremap :oo 0v/.php<cr>3<right>y:e <c-r>0<cr><c-w>250+

" Change selection to uppercase
vnoremap <leader>u U 
vnoremap <leader>c :normal 0i//<cr>
vnoremap <leader>C :normal 0xx<cr>


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
inoremap ' ''<left>
inoremap " ""<left>
inoremap { {}<left>
inoremap ( ()<left>
inoremap < <><left>

"Abbreviations (acts like snippets)
iabbrev /*** /**<cr>*<cr>*/<UP>
iabbrev /@@ /** @var */<LEFT><LEFT><LEFT>
iabbrev privatef private function(<LEFT>
iabbrev publicf public function(<LEFT>
iabbrev protectedf protected function(<LEFT>
iabbrev pub public ;<LEFT>
iabbrev pri private ;<LEFT>
iabbrev pro protected ;<LEFT>
iabbrev var_ var_dump(
iabbrev ret return

"Omy completion setting.
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \ if &omnifunc == "" |
                \   setlocal omnifunc=syntaxcomplete#Complete |
                \ endif
endif

command! -complete=shellcmd -nargs=+ Findfile call s:FindFileCommand(<f-args>)
function! s:FindFileCommand(...)
    let fileName = a:1
    let path = expand("%:p:h")
    
    if 2 == a:0
        let path = a:2
    endif


    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read ! find ' . path . ' -iname "' . fileName . '*"'
    setlocal nomodifiable
    1
endfunction

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

command! -complete=shellcmd -nargs=+ Findusage call s:FindusageCommand(<q-args>)
function! s:FindusageCommand(entity)
    below new
    execute 'silent $read ! findusage '. a:entity . ' ' . expand("%:p:h")
    execute 'redraw'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ Findusagefiles call s:FindusagefilesCommand(<q-args>)
function! s:FindusagefilesCommand(entity)
    below new
    execute 'silent $read ! findusage '. a:entity . ' ' . expand("%:p:h") ' --short' 
    execute 'redraw'
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    setlocal nomodifiable
    1
endfunction

command! -complete=shellcmd -nargs=+ Openusagefiles call s:OpenusagefilesCommand(<q-args>)
function! s:OpenusagefilesCommand(entity)
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

command! -complete=command -nargs=1 List call s:ListSnippets(<q-args>)
fun! s:ListSnippets(needle)
    if a:needle == 'pm'
        execute 'g/public function/p'

    elseif a:needle == 'prm'
        execute 'g/\(private\|protected\) function/p'

    elseif a:needle == 'sm'
        execute 'g/\(private\|public\) static function/p'

    elseif a:needle == 'v'
        execute 'g/[$]\(a-z\|A-Z\|0-9\|_\)* /p'

    else
        echo "arguments available: pm (public methods)|prm (private methods)|sm (static methods)|v (variables)"

    endif
    1
endfunc

command! -complete=command Refactor call s:Refactor()
function! s:Refactor()
    execute ':% s/( /(/g'
    execute ':% s/){/) {/g'
    execute ':% s/ )/)/g'
    execute ':% s/ if(/ if (/g'
    execute ':% s/ foreach(/ foreach (/g'
    execute ':% s/ for(/ for (/g'
    execute ':% s/\t/    /g'
    execute ':% s/ var / public /g'
    execute ':% s/=  /= /g'
    execute ':% s/=   /= /g'
    execute ':% s/=    /= /g'
    execute ':% s/       )/        )/g'

    1
endfunction

command! -complete=command -nargs=1 Alignequals call s:Alignequals(<q-args>)
command! -complete=command -nargs=1 AE call s:Alignequals(<q-args>)
function! s:Alignequals(column)
    execute 'normal 0f='
    execute 'normal '.a:column.'i '
    execute 'normal 0'.a:column.'lvf=hx'
endfunction

command! -complete=command -nargs=1 Alignhere call s:Alignhere(<q-args>)
command! -complete=command -nargs=1 AH call s:Alignhere(<q-args>)
func! s:Alignhere(repeat)
    let col=virtcol(".") - 1
    let @z=':Alignequals '.col.'j'
    execute 'normal '.a:repeat.'@z'
endfunc

command! -range -nargs=1 Alignselect <line1>,<line2>call s:Alignselect(<q-args>)
command! -range -nargs=1 AS <line1>,<line2>call s:Alignselect(<q-args>)
func! s:Alignselect(column)
    let col=a:column
    for lineno in range(a:firstline, a:lastline)
        call s:Alignequals(col)
    endfor
endfunc

" Add PHP class autoload
au FileType php nnoremap gf :call composer#open_file#open(expand('<cword>'))<CR>

