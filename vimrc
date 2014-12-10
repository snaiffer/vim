
" Working with files
  set autowrite             " for autosaving file when you execute :make and some commands like this one
  set termencoding=utf-8
  set fileencodings=utf-8,cp1251
  set encoding=utf-8
  filetype on               " Применять типы файлов
  filetype plugin on
  filetype plugin indent on " определять подсветку на основе кода файла
  filetype indent on
  au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class  " auto-indent for Python
  "Удалять пустые пробелы на концах строк при открытии файла
  "autocmd BufEnter *.* :call RemoveTrailingSpaces()
  "Путь для поиска файлов командами gf, [f, ]f, ^Wf, :find, :sfind, :tabfind и т.д.
  "поиск начинается от директории текущего открытого файла, ищет в ней же
  "и в поддиректориях. Пути для поиска перечисляются через запятую, например:
  "set path=.,,**,/src,/usr/local
  set path=.,,**
  " save backup files to this directory
    set backupdir-=.
    set backupdir^=~/tmp,/tmp

  " Удалить пробелы в конце строк (frantsev)
  function! RemoveTrailingSpaces()
    normal! mzHmy
    execute '%s:\s\+$::ge'
    normal! 'yzt`z
  endfunction
" Working with files


" Outward apprearance and Main settings
  set nocompatible          " отключить режим совместимости с классическим Vi
  set scrolloff=10          " сколько строк внизу и вверху экрана показывать при скроллинге
  set background=dark       " установить цвет фона
  colorscheme elflord
  if has("syntax")          " syntax highlighting by default.
    syntax on
  endif
  set wrap                  " (no)wrap - динамический (не)перенос длинных строк
  set linebreak             " переносить целые слова
  set hidden                " не выгружать буфер когда переключаешься на другой
  "set mouse=a              " Enable mouse usage (all modes)
  "set mousehide            " скрывать мышь в режиме ввода текста
  " Note: when it turn on you cant select text from command line in vim
  set showcmd               " Show (partial) command in status line.
  set matchpairs+=<:>       " показывать совпадающие скобки для HTML-тегов
  set showmatch             " Show matching brackets.
  set autoread              " перечитывать изменённые файлы автоматически
  set t_Co=256              " использовать больше цветов в терминале
  set confirm               " использовать диалоги вместо сообщений об ошибках
  set ruler                 " постоянно показывать позицию курсора
  "Проблема красного на красном при spellchecking-е
  highlight SpellBad ctermfg=Black ctermbg=Red
  "au BufWinLeave *.* silent mkview " при закрытии файла сохранить 'вид'
  "au BufWinEnter *.* silent loadview " при открытии - восстановить сохранённый
  set noswapfile            " не использовать своп-файл (в него скидываются открытые буферы)
  set browsedir=current
  set visualbell            " вместо писка бипером мигать курсором при ошибках ввода
  "set clipboard=unnamed     " во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
  set clipboard=unnamedplus " automatically use the + buffer (the system clipboard) by default
  set backup                " включить сохранение резервных копий
  set title                 " показывать имя буфера в заголовке терминала
  set history=128           " хранить больше истории команд
  set undolevels=2048       " хранить историю изменений числом N
  "подсвечивает все слова, которые совпадают со словом под курсором.
  autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))
  set number                " отображение номеров строк
  set autochdir             " текущий каталог всегда совпадает с содержимым активного окна
  set wildmenu              " Enable smart command line completion on <Tab>
  set wildcharm=<C-Z>       " act like pressing <Tab> but interactively on the command line
  set whichwrap=<,>,[,],h,l " не останавливаться курсору на конце строки
  set showmode              " show the current mode in command line
  set completeopt=menu      " view mode for auto-competion
  set list                  " отображаем табуляции и конечные пробелы...
  set listchars=tab:▸-,trail:⋅

  " Status line
    set laststatus=2          " всегда показывать строку состояния
    "set statusline=%{fugitive#statusline()} " git
    set statusline=%t         " tail of the filename
    set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
    set statusline+=%{&ff}]   " file format
    set statusline+=%h        " help file flag
    set statusline+=%m        " modified flag
    set statusline+=%r        " read only flag
    set statusline+=%y        " filetype
    set statusline+=%=        " left/right separator
    set statusline+=%c,       " cursor column
    set statusline+=%l/%L     " cursor line/total lines
    "Изменяет шрифт строки статуса (делает его не жирным)
    hi StatusLine gui=reverse cterm=reverse
  " Status line
" Outward apprearance and Main settings


" Folding
  set foldenable          " включить фолдинг
  set foldmethod=syntax   " определять блоки на основе синтаксиса файла
  "set foldmethod=indent  " определять блоки на основе отступов
  "set foldmethod=manual
  set foldcolumn=3        " показать полосу для управления сворачиванием
  set foldlevel=99        " по умолчанию всё развёрнуто
  set foldopen=all        " автоматическое открытие сверток при заходе в них
" Folding


" Indent
  set shiftwidth=2  " размер отступов (нажатие на << или >>)
  set tabstop=2     " ширина табуляции
  set softtabstop=2 " ширина 'мягкого' таба
  set autoindent    " ai - включить автоотступы (копируется отступ предыдущей строки)
  set cindent       " ci - отступы в стиле С
  set expandtab     " преобразовать табуляцию в пробелы
  set smartindent   " Умные отступы (например, автоотступ после {)
  set smarttab      " вставка и удаление отступов в начале строки
  " Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
  au FileType crontab,fstab,make set noexpandtab tabstop=4 shiftwidth=4
  set expandtab     " в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<.
" Indent


" Searching text
  "set ignorecase   " Do case insensitive matching
  set nohlsearch    " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
  set incsearch     " поиск фрагмента по мере его набора
  " поиск выделенного текста (начинать искать фрагмент при его выделении)
  vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
  vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>

  " Поиск выделенного текста (frantsev.ru/configs/vimrc.txt)
  function! VisualSearch()
    let l:old_reg=getreg('"')
    let l:old_regtype=getregtype('"')
    normal! gvy
    let @/=escape(@@, '$.*/\[]')
    normal! gV
    call setreg('"', l:old_reg, l:old_regtype)
  endfunction


  " Search Stack
    " ========================================================================
    " Search Stack - a quick solution to searching all open buffers (even unnamed)
    " To search - :SS /search pattern/
    " This will open a window with the search stack results (most recent search on
    " top)
    " To follow a match, hit enter.
    " To return to the search results use <Leader>sh
    " ========================================================================
    if exists("loaded_sestack")
      finish
    endif
    let loaded_sestack = 1

    let s:results = []
    let s:last_line = -1

    function! <SID>Search(pat)
      if len(s:results) > 10
        remove(s:results, 0)
      endif
      call add(s:results, [])
      let l:result = s:DoSearch(a:pat, 's:AppendResults')
      if l:result == -1
        return
      endif
      if len(s:results[-1]) == 0
        echo "No matches!"
        return
      endif
      call s:ShowResults()
      normal 5G
      call s:ShowMatch()
    endfunction
    command! -nargs=1 SS call <SID>Search(<q-args>)

    function! <SID>DoSearch(pat, func)
      let v:errmsg = ""
      let l:startbuf = bufnr("%")
      let l:startwin = winnr()
      if a:pat !~ "^/.*/$"
        echo "Search must start and end with \"/\""
        return -1
      endif
      let l:pat = a:pat[1:-2]
      let l:cmd = "bufdo g/" . l:pat . "/call " . a:func . "()"
      silent! exe l:cmd
      exe l:startwin . "wincmd w"
      exe "buffer! " . l:startbuf
      if v:errmsg != ""
        echo v:errmsg
      endif
    endfunction

    function! <SID>AppendResults()
      if bufname('%') != '[SS]'
        let l:curtext = getline('.')
        let l:curline = line('.')
        let l:curbuf = bufnr('%')
        let l:bufname = bufname('%')
        if l:bufname == ''
          let l:bufname = '[Buffer #' . l:curbuf . ']'
        endif
        call add(s:results[-1], [@/, [l:curbuf, l:bufname, l:curline, l:curtext]])
      endif
    endfunction

    function! <SID>FindWindow()
      for i in range(winnr('$'))
        let l:bn = winbufnr(i + 1)
        if l:bn != -1
          if bufname(l:bn) == '[SS]'
            return i
          endif
        endif
      endfor
      return -1
    endfunction

    function! <SID>ShowResults()
      let l:winnr = s:FindWindow()
      if l:winnr == -1
        exe "silent! botright sp [SS]"
        resize 6
      else
        " TODO: How do I goto a window, instead of assuming it's still
        " the bottom right window?
        wincmd b
        exe "silent! e! [SS]"
      endif

      setlocal bufhidden=delete
      setlocal buftype=nofile
      setlocal modifiable
      setlocal noswapfile
      setlocal nowrap

      nnoremap <buffer> <silent> <cr> :call <SID>SelectMatch()<cr>
      autocmd! CursorMoved <buffer> silent call <SID>ShowMatch()
      nnoremap <buffer> <silent> <LeftMouse> <LeftMouse>:call <SID>SelectMatch()<cr>

      let l:revlist = reverse(copy(s:results))
      for r in l:revlist
        let l:ph = 0
        for m in r
          if !l:ph
            put = ''
            put = '================================='
            put = 'Search string: ' . m[0]
            let l:ph = 1
          endif
          let i = m[1]
          put = i[0] . ' ' . i[1] . ' ' . i[2] . ' : ' . i[3]
        endfor
      endfor

      setlocal nomodifiable

      " Goto the saved line
      if s:last_line != -1
        exe 'normal ' . s:last_line . 'G'
      endif
    endfunction
    command! -nargs=0 SH call <SID>ShowResults()

    function! <SID>SelectMatch()
      let l:line = getline('.')
      let l:ml = matchlist(getline('.'), '\v^\s*(\d+).{-}(\d+) :')
      let s:last_line = line('.')
      exe "normal \<c-w>p"
      exe 'b ' . l:ml[1]
      exe 'normal ' . l:ml[2] . 'G'
    endfunction

    function! <SID>ShowMatch()
      let l:ss = ''
      let l:line = line('.')
      while getline(l:line) !~ '\v^\=+$'
        let l:ml = matchlist(getline(l:line), '\vSearch string: (.*) $')
        if len(l:ml)
          let l:ss = l:ml[1]
          break
        endif
        let l:line = l:line - 1
        if l:line == 0
          break
        endif
      endwhile

      if l:ss != ''
        exe '2match Search /' . l:ss . '/'
        exe "let @/ = \'" . escape(l:ss, "'") . "'"
        autocmd! BufLeave <buffer> call <SID>SeStackLeave()
      endif
    endfunction

    function! <SID>SeStackLeave()
      silent 2match none
      let s:last_line = line('.')
    endfunction

    function! <SID>SelectPrev()
      if s:FindWindow() == -1
        call s:ShowResults()
      endif
      " TODO: Goto the window (again blindly)
      wincmd b

      if s:last_line == -1
        normal G
      endif

      let l:res = search('\v^\s*\d+', 'bW')
      if l:res == 0
        echo 'No previous matches'
        return
      endif
      call s:SelectMatch()
    endfunction
    command! -nargs=0 SP call <SID>SelectPrev()

    function! <SID>SelectNext()
      if s:FindWindow() == -1
        call s:ShowResults()
      endif
      " TODO: Goto the window (again blindly)
      wincmd b

      if s:last_line == -1
        normal gg
      endif

      let l:res = search('\v^\s*\d+', 'W')
      if l:res == 0
        echo 'No more matches'
        wincmd p
        return
      endif
      call s:ShowMatch()
      call s:SelectMatch()
    endfunction
    command! -nargs=0 SN call <SID>SelectNext()

    function! <SID>ClearSearchStack()
      let s:results = []
    endfunction
    command! -nargs=0 SC call <SID>ClearSearchStack()
  " Search Stack
" Searching text


" Проверка орфографии
  if version >= 700
    " По умолчанию проверка орфографии выключена.
    set spell spelllang=
    set nospell
  endif
" Проверка орфографии


" Plugins
  " Vundle  --plugins manager
    set nocompatible
    filetype off                " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " The list of plugins to use
      " original repos on GitHub
        "" let Vundle manage Vundle
        "  Bundle 'gmarik/vundle'
        " File manager
          Bundle 'scrooloose/nerdtree'
        " for creating view of classes, functions, variables in tree struction
          Bundle 'majutsushi/tagbar'
        " auto-complete code for C or C++
          Bundle 'Rip-Rip/clang_complete'
        " for auto adding language constructions
          Bundle 'msanders/snipmate.vim'
        " open any version of a file in git
          Bundle 'vim-scripts/git-file.vim'
        " Git wrapper
          Bundle 'tpope/vim-fugitive'
        " auto-complete code for Python
          Bundle 'davidhalter/jedi-vim'
        " HTML5 + inline SVG omnicomplete funtion, indent and syntax
          Bundle 'othree/html5.vim'
        " syntax and indent plugins for JavaScript
          Bundle "pangloss/vim-javascript"

      "репозитории vim/scripts
        " Bundle 'FuzzyFinder'

      "git репозитории (не на github)
        " Bundle 'git://git.wincent.com/command-t.git'

      "локальные git репозитории(если работаете над собственным плагином)
        " Bundle 'file:///Users/gmarik/path/to/plugin'
    " The list of plugins to use

    filetype plugin indent on   " required!
  " Vundle  --plugins manager

  " Settings for plugins
    " Clang_complete
      let g:clang_user_options='|| exit 0'
      " let g:clang_user_options='' " for example: '-std=c++11'

    " ctags
      "set tags=/usr/include/tags,./tags
      set tags=/usr/lib/python2.7/dist-packages/kivy/tags,./tags

    " NERDTree
      let g:NERDTreeWinSize=25  " width of window
  " Settings for plugins

" Plugins


" Hot Keys
  " Usual Ctrl
    " CTRL-X - вырезать
    vnoremap <C-X> "+x
    " CTRL-C - копировать
    vnoremap <C-C> "+y
    " CTRL-V вставить под курсором
    map <C-V>      "+gP
    "" Отменить-вернуть через Ctrl
    " отмена действия
    noremap <C-Z> u
    inoremap <C-Z> <C-O>u
    " вернуть отменённое назад
    noremap <C-Y> <C-R>
    inoremap <C-Y> <C-O><C-R>
  " Usual Ctrl

  " Get menu
    map <F4> :emenu <C-Z>

  " Spell checker
    if version >= 700
      menu spell.off :setlocal spell spelllang=<CR>:setlocal nospell<CR>
      menu spell.ru+en :setlocal spell spelllang=ru,en<CR>
      menu spell.ru :setlocal spell spelllang=ru<CR>
      menu spell.en :setlocal spell spelllang=en<CR>
      menu spell.-spellControl- :
      menu spell.Word_Suggest<Tab>z= z=
      menu spell.add_toDict<Tab>zg zg
      menu spell.add_toTempDict<Tab>zG zG
      menu spell.remove_fromDict<Tab>zw zw
      menu spell.remove_fromTempDict<Tab>zW zW
      menu spell.previous_Wrong_Word<Tab>[s [s
      menu spell.next_Wrong_Word<Tab>]s ]s
    endif
  " Spell checker

  " Wrapper for :make
    map wmr <ESC> :w \| !clear && make && clear && ./

    nmap ,m :make<CR>
    nmap ,w :cwindow<CR>
    nmap ,n :cnext<CR>
    nmap ,p :cprevious<CR>
    nmap ,l :clist<CR>

    menu make.make<Tab>,m ,m
    menu make.make_Window<Tab>,w ,w
    menu make.next_Error<Tab>,n ,n
    menu make.previous_Error<Tab>,p ,p
    menu make.errors_List<Tab>,l ,l
  " Wrapper for :make
 
  " Save and run
    nmap <Leader>w :w \| !chmod +x ./% && clear && ./% <cr>

  " Buffers
    " show previous buffer
      map <A-left> :bp<cr>
      nmap <A-left> :bp<cr>
      imap <A-left> <ESC>:bp<cr>i
    " show next buffer
      map <A-right> :bn<cr>
      nmap <A-right> :bn<cr>
      imap <A-right> <ESC>:bn<cr>i
    " open all buffers in a new tab
      nmap <A-up> :tab sball<cr>
      imap <A-up> <ESC>:tab sball<cr>
    " close the current buffer
      nmap <A-down> :bd<cr>
      imap <A-down> <ESC>:bd<cr>
  " Buffers

  " Переключение табов (вкладок) (rxvt-style)
    map <S-left> :tabprevious<cr>
    nmap <S-left> :tabprevious<cr>
    imap <S-left> <ESC>:tabprevious<cr>i
    map <S-right> :tabnext<cr>
    nmap <S-right> :tabnext<cr>
    imap <S-right> <ESC>:tabnext<cr>i
    nmap <S-up> :tabedit %<cr>
    imap <S-up> <ESC>:tabedit %<cr>
    nmap <S-down> :tabclose<cr>
    imap <S-down> <ESC>:tabclose<cr>
  " Переключение табов (вкладок) (rxvt-style)

  " For Tagbar
    nmap <F8> :TagbarToggle<CR>

  " Update ctags
    nmap <F3> :!echo "Ctags creation for the current dir is stated. It may take much time. Wait." && ctags -R --extra=+q .<CR><CR>

  " File Manager
    map <F12> :NERDTreeToggle<cr>
    vmap <F12> <esc>:NERDTreeToggle<cr>i
    imap <F12> <esc>:NERDTreeToggle<cr>i

  " Pasting text from another app with automatic indentation can destroy the indentation of the pasted text.
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2> " Press <F2> to turn on/off auto-indent

  " Search Stack - a quick solution to searching all open buffers (even unnamed)
    " To search - :SS /search pattern/
      nmap <Leader>S :SS/<c-r>=expand("<cword>")<cr>/<cr>
    " To follow a match, hit enter
    " To return to the search results use <Leader>sh
      nmap <silent> <unique> <Leader>sh :SH<CR>
    " To go to next
      nmap <silent> <unique> <Leader>sp :SP<CR>
    " To go to previous
      nmap <silent> <unique> <Leader>sn :SN<CR>
  " Search Stack

  " Replace the word under the cursor through all text
    nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
" Hot Keys


" Test settings

" Test settings
