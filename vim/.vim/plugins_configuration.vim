" -----------
" Plug 'unblevable/quick-scope' {{{
" -------------
if dein#tap('quick-scope')
    " this has to be set before colorscheme
    augroup qs_colors
        autocmd!
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
    augroup END
    " Trigger a highlight in the appropriate direction when pressing these keys:
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    " Turn off this plugin when the length of line is longer than g:qs_max_chars. (default: 1000)
    let g:qs_max_chars=1000
    let g:qs_lazy_highlight = 1
endif
" }}}

" ------------------
" 'morhetz/gruvbox' {{{
" ------------------
if dein#tap('gruvbox')
" colorscheme settings must after plug#end(),cuz only when plug#end that plugins work
"if has('gui_running')
    "colorscheme SolarizedDark
"else
    " colorscheme zenburn
    set background=dark
    " colorscheme hybrid_reverse
    colorscheme gruvbox
"endif
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif 
" }}}

" ====== plugins configurations
" ------------- {{{
"  ctrlsf
" ------------- 
" if executable('ag')
"     let g:ctrlsf_ackprg = 'ag'
" endif
" let g:ctrlsf_case_sensitive = 'smart'
" let g:ctrlsf_default_root = 'project'
" let g:ctrlsf_default_view_mode = 'normal'
" let g:ctrlsf_position = 'left'
" let g:ctrlsf_winsize = '30%'
"
" nmap <C-f> :CtrlSF <C-r><C-w>
" imap <C-f> <ESC>:CtrlSF<Space>
" " visiual and select mode
" vmap <C-f> "1y:CtrlSF<Space><C-R>1<CR>
" " visiual mode
" " xnoremap <C-f> :CtrlSF<Space>
" " command line mode
" cmap <C-f> CtrlSF<Space>
"


" ------------
" ctrlp
" ------------
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"" set local working directory:current file
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40
"" exclusions
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
            "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
            "\ 'file': '\v\.(exe|so|dll)$',
            "\ }
"" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
"" Use a custom file listing command:
"" The Silver Searcher
"if executable('ag')
    "" Use ag over grep
    "let g:ctrlp_user_command = ['ag','ag %s -i --nocolor --nogroup --hidden
                "\ --ignore .git
                "\ --ignore .svn
                "\ --ignore .hg
                "\ --ignore .DS_Store
                "\ --ignore "**/*.pyc"
                "\ -g ""' ]
"elseif IsUnix() || IsMac()
    "let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"elseif IsWin32()
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"endif
"
" ------------
" nerdtree
" ------------
" let NERDTreeWinPos='left'
" let NERDTreeWinSize=30
" " 当不带参数打开Vim时自动加载项目树 -- no
" autocmd StdinReadPre * let s:std_in=1
" " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" " 当所有文件关闭时关闭项目树窗格
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" "ignore files in NERDTree
" let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
" " 不显示项目树上额外的信息，例如帮助、提示什么的
" let NERDTreeMinimalUI=1
" "Refresh both CtrlP and NERDTree
" " nmap <Leader>r :NERDTreeFocus<CR>R<c-w><c-p>:CtrlPClearCache<CR>
"
" " returns true iff is NERDTree open/active
" " function! s:isNTOpen()
" "     return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" " endfunction
" "
" " " switch to current file directory
" " function! SyncTree()
" "     if s:isNTOpen()
" "         NERDTreeClose
" "     else
" "         NERDTreeCWD
" "     endif
" " endfunction
"
" " autocmd BufEnter * lcd %:p:h
" nnoremap <Leader>nc :NERDTreeCWD<CR>
" nnoremap <Leader>nt :NERDTreeToggle<CR>
" }}}

" -------------- 
"  syntastic {{{
" --------------
if dein#tap('syntastic')
    " syntastic default config
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    " overwrite quickfix when execute :SyntasticSetLocList
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    nnoremap <Leader>sy :SyntasticToggleMode<CR>
endif
" }}}

" ---------------
" nerdcommenter {{{
" ---------------
if dein#tap('nerdcommenter')
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1
    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
    let g:NERDCustomDelimiters = { 'java': { 'left': '//'} }
    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1
    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " nnoremap <C-/> :call NERDComment("n", "Toggle")<CR>
    if has('win32')
        nmap <C-/> <Plug>NERDCommenterToggle
        vmap <C-/> <Plug>NERDCommenterToggle
    else
        nmap <C-_> <Plug>NERDCommenterToggle
        vmap <C-_> <Plug>NERDCommenterToggle
    endif
endif
" }}}

" -----------------------
" markdown-preview.nvim {{{
" -----------------------
if dein#tap('markdown-preview.nvim')
    " set to 1, nvim will open the preview window after entering the markdown buffer
    " default: 0
    let g:mkdp_auto_start = 0

    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    " default: 1
    let g:mkdp_auto_close = 1

    " set to 1, the vim will refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    " default: 0
    let g:mkdp_refresh_slow = 0

    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it can be use in markdown file
    " default: 0
    let g:mkdp_command_for_global = 0

    " set to 1, preview server available to others in your network
    " by default, the server listens on localhost (127.0.0.1)
    " default: 0
    let g:mkdp_open_to_the_world = 0

    " use custom IP to open preview page
    " useful when you work in remote vim and preview on local browser
    " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
    " default empty
    let g:mkdp_open_ip = ''

    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = g:chrome

    " set to 1, echo preview page url in command line when open preview page
    " default is 0
    let g:mkdp_echo_preview_url = 0

    " a custom vim function name to open preview page
    " this function will receive url as param
    " default is empty
    let g:mkdp_browserfunc = ''

    " options for markdown render
    " mkit: markdown-it options for render
    " katex: katex options for math
    " uml: markdown-it-plantuml options
    " maid: mermaid options
    " disable_sync_scroll: if disable sync scroll, default 0
    " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    "   middle: mean the cursor position alway show at the middle of the preview page
    "   top: mean the vim top viewport alway show at the top of the preview page
    "   relative: mean the cursor position alway show at the relative positon of the preview page
    " hide_yaml_meta: if hide yaml metadata, default is 1
    " sequence_diagrams: js-sequence-diagrams options
    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {}
        \ }

    " use a custom markdown style must be absolute path
    " sindresorhus/github-markdown-css --> minimal markdown style of github
    let g:mkdp_markdown_css = '~/.vim/other/css/github-markdown.css'

    " use a custom highlight style must absolute path
    " let g:mkdp_highlight_css = '~/.vim/style/solarized_dark.css'
    let g:mkdp_highlight_css = ''

    " use a custom port to start server or random for empty
    let g:mkdp_port = ''

    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'

    map <silent> <F8> <Plug>MarkdownPreview       
    map <silent> <F9> <Plug>MarkdownPreviewStop  

    nmap <silent> <Leader>md <Plug>MarkdownPreview
endif
" }}}

" -----------------
" skanehira/preview-markdown.vim {{{
" -----------------
let g:preview_markdown_vertical = 1
let g:preview_markdown_parser = 'mdr'
" }}}

" -----------------
" vim-table-mode {{{
" -----------------
if dein#tap('vim-table-mode')
    " 配置快捷键
    nmap <Leader>tm :TableModeToggle<CR>
    " markdown-compatible tables
    let g:table_mode_corner='|'

    function! s:isAtStartOfLine(mapping)
      let text_before_cursor = getline('.')[0 : col('.')-1]
      let mapping_pattern = '\V' . escape(a:mapping, '\')
      let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
      return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
    endfunction
    " 插入模式下，按 || 使能插件
    inoreabbrev <expr> <bar><bar>
              \ <SID>isAtStartOfLine('\|\|') ?
              \ '<c-o>:TableModeEnable<CR><bar><space><bar><left><left>' : '<bar><bar>'
    " 插入模式下，按 __ 失能插件
    inoreabbrev <expr> __
              \ <SID>isAtStartOfLine('__') ?
              \ '<c-o>:silent! TableModeDisable<CR>' : '__'
endif
" }}}

" ---------------------------
" indentLine configuration {{{
" ---------------------------
if dein#tap('indentLine')
    " do not highlight conceal color(not background)
    let g:indentLine_setColors = 1
    " customize conceal color
    " Vim
    let g:indentLine_color_term = 239

    " GVim
    let g:indentLine_color_gui = '#A4E57E'

    " none X terminal
    let g:indentLine_color_tty_light = 7 " (default: 4)
    let g:indentLine_color_dark = 1 " (default: 2)

    " Background (Vim, GVim)
    let g:indentLine_bgcolor_term = 202

    " let g:indentLine_char = 'c'
    " let g:indentLine_char_list = ['|', '|', '┆', '┊']
    " change conceal behaviour
    let g:indentLine_concealcursor = ''
    let g:indentLine_conceallevel = 2

    " -------------
    " jedi-vim
    " -------------
    "let g:jedi#auto_initialization = 1
    ""let g:jedi#completion_enabled = 0
    ""let g:jedi#auto_vim_configuration = 0
    ""let g:jedi#smart_auto_mapping = 0
    "let g:jedi#popup_on_dot = 1
    "let g:jedi#completion_command = ""
    "let g:jedi#show_call_signatures = "1"
endif
" }}}

" ----------------
" vim-pencil {{{
" ---------------- 
" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd,md call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END
" let g:airline_section_x = '%{PencilMode()}'
"
"----------------------------
"YouCompleteMe
"----------------------------
"let g:ycm_key_invoke_completion = '<M-/>' "default <C-Space>,modify to alt+/
"" 自动补全配置
"set completeopt=longest,menu " "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"
""youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
"
"let g:ycm_min_num_of_chars_for_completion = 1
""在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" 让YouCompleteMe同时利用原来的ctags
"let g:ycm_collect_identifiers_from_tag_files = 1  
"let g:clang_user_options='|| exit 0'
"nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" let g:ycm_server_python_interpreter=g:python3_host_prog
" let g:ycm_global_ycm_extra_conf= g:ycm_extra_conf

" add support completions of java
" let g:EclimCompletionMethod = 'omnifunc'
" add support completions of python
" let g:ycm_python_binary_path =g:python3_host_prog
" }}}

" -------------------
"  delimitMate {{{
"  ------------------
" inoremap {<CR> {<CR>}<C-o>O
" Use this option to tell delimitMate which characters should be considered
" matching pairs. Read |delimitMateAutoClose| for details.
" let delimitMate_matchpairs = "(:),[:],{:}"
" au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
"}}}

"
" -----------------------
"  vim-signature {{{
" -----------------------
"
if dein#tap('vim-signature')
    let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "dm/",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]<Leader>",
            \ 'GotoPrevLineByPos'  :  "[<Leader>",
            \ 'GotoNextSpotByPos'  :  "]`",
            \ 'GotoPrevSpotByPos'  :  "[`",
            \ 'GotoNextMarker'     :  "]-",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListBufferMarks'    :  "m/",
            \ 'ListBufferMarkers'  :  "m?"
            \ }
endif
" }}}

" -----------------------
"  marks-browers {{{
"  -----------------------
if dein#tap('Marks-Browser')
    nmap <silent> <Leader>mb :MarksBrowser<CR>
    " the browser window close itself after you jump to a mark
    let marksCloseWhenSelected = 1
endif
" }}}

" ----------------------
" vim-multiple-cursor {{{
" ----------------------
" if dein#tap('vim-multiple-cursors')
"     let g:multi_cursor_use_default_mapping=0
"     " Default mapping
"     let g:multi_cursor_start_word_key      = '<C-m>'
"     let g:multi_cursor_select_all_word_key = '<A-m>'
"     let g:multi_cursor_start_key           = 'g<C-m>'
"     let g:multi_cursor_select_all_key      = 'g<A-m>'
"     let g:multi_cursor_next_key            = '<C-m>'
"     let g:multi_cursor_prev_key            = '<C-p>'
"     let g:multi_cursor_skip_key            = '<C-x>'
"     let g:multi_cursor_quit_key            = '<Esc>'
"     " fix <A-n> not working in VIM,but works in gVIM
"     if !has('gui_running')
"         map "in Insert mode, type Ctrl+v Alt+n here" <A-n>
"     endif
"     " fix <C-n> not working in gVIM
"     set selection=inclusive
" endif
" }}}

" ---------------
" limelight {{{
" ---------------
if dein#tap('limelight.vim')
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 'gray'
    let g:limelight_conceal_ctermfg = 240

    " Color name (:help gui-colors) or RGB color
    let g:limelight_conceal_guifg = 'DarkGray'
    let g:limelight_conceal_guifg = '#777777'

    " Default: 0.5
    let g:limelight_default_coefficient = 0.7

    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 1

    " Beginning/end of paragraph
    "   When there's no empty line between the paragraphs
    "   and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'

    " Highlighting priority (default: 10)
    "   Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1
endif
" }}}

" ----------------
" goyo.vim {{{
" ----------------
if dein#tap('goyo.vim')
    let g:gyo_width=80
    let g:goyo_height='85%'
    let g:goyo_linenr=0

    nmap <Leader>gy :Goyo<CR>
    xmap <Leader>gy :Goyo<CR>

    "进入goyo模式后自动触发limelight,退出后则关闭
    function! s:goyo_enter()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      endif
      Limelight
      " ...
    endfunction

    function! s:goyo_leave()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      endif
      Limelight!
      " ...
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif
" }}}

" ------------------
" tagbar {{{
" ------------------
if dein#tap('tagbar')
    " todo:: key mapinig conflict
    map <silent> <Leader>tb :TagbarOpenAutoClose<CR>
    let g:tagbar_ctags_bin = g:ctags_path
endif
" }}}

" --------------------
" undotree {{{
" --------------------
" if dein#tap('undotree')
"     nnoremap <Leader>ud :UndotreeToggle<CR>
"     " 持久化历史记录
"     " if has("persistent_undo")
"     "     set undodir=$HOME."/.undodir"
"     "     set undofile
"     " endif
" endif
" }}}


" ------------------------
" fzf  {{{
" ------------------------
if dein#tap('fzf.vim')
    let $FZF_DEFAULT_COMMAND="rg --files . --hidden -uuu --glob '!.git/**'"
    " let g:fzf_tags_command = 'ctags -R
    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " In Neovim, you can set up fzf window using a Vim command
    let g:fzf_layout = {'window': {'width': 0.8,'height': 0.8}}
    " let $FZF_DEFAULT_OPTS .= ' --inline-info'
    let $FZF_DEFAULT_OPTS='--height 90% --layout=reverse --bind=alt-j:down,alt-k:up,alt-i:toggle+down --border --preview
                \ "[[ $(file --mime {}) =~ binary ]]      &&
                \ echo {} is a binary file               ||
                \ (bat --style=numbers --color=always {} ||
                \ highlight -O ansi -l {}               ||
                \ coderay {}                            ||
                \ rougify {}                            ||
                \ cat {}) 2> /dev/null | head -500"
                \ --preview-window=down'

    " Hide statusline of terminal buffer
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    autocmd! FileType fzf tnoremap <buffer> <ESC> <C-c>


    command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
    nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
    xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR> 


    function! s:searchTextCmd(path,params)
        if strlen(a:path)
            return 'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(a:params).' '.shellescape(FindRootDirectory())
        endif
        return 'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(a:params)
    endfunction

    command! -bang -nargs=* Rgrep
      \ call fzf#vim#grep(
      \   <SID>searchTextCmd(FindRootDirectory(),<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
    " nnoremap <silent> <C-n> :call fzf#vim#files(<SID>getProjectDir())<CR>
    nnoremap <silent> <C-n> :call fzf#vim#gitfiles(FindRootDirectory())<CR>
    " nnoremap <F2> :call <SID>setProjectDir(expand('%:p:h'))<CR>
    " function! s:getProjectDir()
    "     return get(g:,'project_path',expand('%:p:h'))
    " endfunction
    " function! s:setProjectDir(path)
    "     let g:project_path = a:path
    "     echom 'set project directory: ' . a:path
    " endfunction
endif
" }}}

" -------------------
" tpope/vim-repeat {{{
" -------------------
if dein#tap('vim-repeat')
    silent! call repeat#set("\<Plug>MarkdownPreview", v:count)
endif
" }}}

" -------------------
" coc.nvim {{{
" -------------------
if dein#tap('coc.nvim')
    " #1775: fix cursor getting thin when run CocList
    let g:coc_disable_transparent_cursor = 1
    let g:coc_global_extensions = [
                \ 'coc-tsserver','coc-html','coc-css','coc-vetur',
                \ 'coc-java','coc-python','coc-flutter','coc-vimlsp',
                \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
                \ 'coc-highlight',
                \ 'coc-pairs',
                \ 'coc-explorer',
                \ 'coc-json',
                \ 'coc-prettier',
                \]

    " if hidden is not set, TextEdit might fail.
    set hidden

    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Better display for messages
    set cmdheight=2

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use tab for trigger completion with characters ahead and navigate.
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> <Leader>gd <Plug>(coc-definition)
    nmap <silent> <Leader>gy <Plug>(coc-type-definition)
    nmap <silent> <Leader>gi <Plug>(coc-implementation)
    nmap <silent> <Leader>gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " coc-hightlight: Highlight symbol under cursor on CursorHold
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    " hi default link CocHighlightText CocUnderline

    " Remap for rename current word
    nmap <Leader>rn <Plug>(coc-rename)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<Leader>aap` for current paragraph
    xmap <Leader>a  <Plug>(coc-codeaction-selected)
    nmap <Leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <Leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <Leader>fc  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <C-d> <Plug>(coc-range-select)
    xmap <silent> <C-d> <Plug>(coc-range-select)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Formatting selected code.
    xnoremap <silent> <leader>fm :call CocAction('formatSelected', visualmode())<CR>
    nnoremap <silent> <leader>fm :call CocAction('format')<CR>

    " -------------------
    " coc-prettier
    " -------------------
    command! -nargs=0 Prettier :CocCommand prettier.formatFile
    " Remap for format selected region
    augroup prettierformat
    autocmd!
    autocmd FileType javascript,typescript,css nnoremap <silent> <Leader>fm  :CocCommand prettier.formatFile<CR>
    autocmd FileType javascript,typescript,css xnoremap <silent> <Leader>fm  <Plug>(coc-format-selected)
    augroup END

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
    " Manage extensions
    " nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
    " Show commands
    " nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    " nmap <silent> <Leader>h :pclose<CR>
    autocmd VimEnter * silent! unmap <Leader>cl | nnoremap <Leader>cl :<C-u>CocList<CR>
    " -------------------
    " coc-explorer
    " -------------------
    "
    " Use preset argument to open it
    " nnoremap <space>ed   :CocCommand explorer --preset .vim<CR>
    nnoremap <Leader>ef   :CocCommand explorer --preset floating<CR>
    nnoremap <silent> <Leader>ep :exec 'CocCommand explorer '.getcwd()<CR>
    " autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

    " List all presets
    " nnoremap <space>el :CocList explPresets

    " -------------------
    "iamcco/coc-vimlsp 
    " -------------------
    let g:markdown_fenced_languages = [
          \ 'vim',
          \ 'help'
          \]
    endif
" }}}

" -------------------
" vim.run  {{{
" ------------------
if dein#tap('vim-run')
    let g:vim_run_command_map = {
      \'javascript': 'node',
      \'python': 'python',
      \'java': 'java',
      \'html': 'chrome',
      \'dosbatch': 'cmd',
      \}

    nnoremap <Leader>cmd :Run<CR>
    vnoremap <Leader>cmd :Run<CR>
endif
" }}}

" -------------------
" vim-http {{{
" -------------------
if dein#tap('vim-http')
    " clean a request before sending it to curl
    let g:vim_http_clean_before_do = 1
    " response shown on vertical window
    let g:vim_http_split_vertically = 1
    " response buffers overwriten
    let g:vim_http_tempbuffer = 1
endif
" }}}

" -------------------
" vim-prettier {{{
" -------------------
if dein#tap('vim-prettier')
    " Disable auto formatting of files that have "@format" tag
    let g:prettier#autoformat = 0
    " print semicolons
    " Prettier default: true
    let g:prettier#config#semi = 'true'
    " single quotes over double quotes
    " Prettier default: false
    let g:prettier#config#single_quote = 'true'
    " print spaces between brackets
    " Prettier default: true
    let g:prettier#config#bracket_spacing = 'true'
    " none|es5|all
    " Prettier default: none
    let g:prettier#config#trailing_comma = 'all'
    nnoremap <Leader>pt :PrettierAsync<CR>
    vnoremap <Leader>pt :PrettierAsync<CR>
endif
" }}}

" -------------------
" 'schickling/vim-bufonly' {{{
" -------------------
if dein#tap('vim-bufonly')
    nnoremap <Leader>bo :BufOnly<CR>
endif
" }}}

" -------------------
" vim-airline/vim-airline {{{
" -------------------
if dein#tap('vim-airline')
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'
endif
" }}}


" -------------
" Plug 'liuchengxu/vim-which-key' {{{
" -------------
if dein#tap('vim-which-key')
    " By default timeoutlen is 1000 ms
    " set timeoutlen=3000
    " Map leader to which_key
    " let g:mapleader = "\<Space>"
    nnoremap <silent> <Leader><Leader> :silent WhichKey '<Space>'<CR>
    vnoremap <silent> <Leader><Leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
    " Map \ to which_key
    let g:maplocalleader = '\'
    nnoremap <silent> <localleader> :silent <c-u> :silent WhichKey  '\'<CR>
    vnoremap <silent> <localleader> :silent <c-u> :silent WhichKeyVisual  '\'<CR>

    " Define prefix dictionary
    let g:which_key_map =  {}
    " call which_key#register('\', "g:which_key_map")
    call dein#set_hook(dein#plugin.name,'hook_post_source','call which_key#register("\\","g:which_key_map")')
    " format: {char} : [{action} , {description}
    " {action}: execute in normal mode or command/function
    " single mappings
    let g:which_key_map['e'] = [ ':CocCommand explorer' , 'explorer'  ]
    " let g:which_key_map['t'] = ['Rgrep' , 'search text']
    " prefix mappings
    let g:which_key_map.w = {
          \ 'name' : '+windows' ,
          \ 'w'    : ['<C-W>w'     , 'other-window']          ,
          \ 'd'    : ['<C-W>c'     , 'delete-window']         ,
          \ '-'    : ['<C-W>s'     , 'split-window-below']    ,
          \ '|'    : ['<C-W>v'     , 'split-window-right']    ,
          \ '2'    : ['<C-W>v'     , 'layout-double-columns'] ,
          \ 'h'    : ['<C-W>h'     , 'window-left']           ,
          \ 'j'    : ['<C-W>j'     , 'window-below']          ,
          \ 'l'    : ['<C-W>l'     , 'window-right']          ,
          \ 'k'    : ['<C-W>k'     , 'window-up']             ,
          \ 'H'    : ['<C-W>5<'    , 'expand-window-left']    ,
          \ 'J'    : ['resize +5'  , 'expand-window-below']   ,
          \ 'L'    : ['<C-W>5>'    , 'expand-window-right']   ,
          \ 'K'    : ['resize -5'  , 'expand-window-up']      ,
          \ '='    : ['<C-W>='     , 'balance-window']        ,
          \ 's' : {
            \ 'name': '+split-window'   ,
            \ 'j' : [':rightbelow new'   , 'horizontial split (down)']  ,
            \ 'k' : [':leftabove new'   , 'horizontial split (above)'] ,
            \ 'l' : [':rightbelow vnew' , 'vertical split (right)']    ,
            \ 'h' : [':leftabove vnew'   , 'vertical split (left)']    ,
            \},
          \ 'v'    : ['<C-W>v'     , 'split-window-below']    ,
          \ '?'    : ['Windows'    , 'fzf-window']            ,
          \ }
    let g:which_key_map.o = {
          \ 'name' : '+open'                  ,
          \ 'q'    : ['copen'                 , 'open-quickfix']              ,
          \ 'e'    : [':CocCommand explorer'  , 'coc-explorer']               ,
          \ 'r'    : [':FloatermNew ranger'  , 'ranger']               ,
          \ 'v'    : [':botright vs $MYVIMRC' , 'edit myvimrc(bottom right)'] ,
          \ 'p'    : [':CocList explPresets' , 'show presets'] ,
          \ }

    let g:which_key_map.b = {
          \ 'name' : '+buffer'        ,
          \ '1' : ['b1'               , 'buffer 1']                    ,
          \ '2' : ['b2'               , 'buffer 2']                    ,
          \ 'd' : ['bd'               , 'delete-buffer']               ,
          \ 'f' : ['bfirst'           , 'first-buffer']                ,
          \ 'h' : ['Startify'         , 'home-buffer']                 ,
          \ 'l' : ['blast'            , 'last-buffer']                 ,
          \ 'n' : ['bnext'            , 'next-buffer']                 ,
          \ 'p' : ['bprevious'        , 'previous-buffer']             ,
          \ '?' : ['Buffers'          , 'fzf-buffer']                  ,
          \ 'w' : [':w'               , 'buffer save']                 ,
          \ 's' : [':w !sudo tee %'   , 'buffer save in readonly']     ,
          \ 'q':  [':q'               , 'exit buffer']                 ,
          \ 'e' : [':q!'              , 'discard buffer']              ,
          \ 'o' : {
            \ 'name': '+open/only...' ,
            \ '?' : ['Buffers'        , 'fzf-buffer']                  ,
            \ 'o' : [':only'          , 'buffer only']                 ,
            \ 'O' : [':BufOnly'       , 'buffer only & remove others'] ,
            \}                        ,
          \ }
    let g:which_key_map.s = {
          \ 'name' : '+search'       ,
          \ '/' : [':History/'       , 'history']            ,
          \ ';' : [':Commands'       , 'commands']           ,
          \ 'a' : [':Ag'             , 'text Ag']            ,
          \ 'b' : [':BLines'         , 'current buffer']     ,
          \ 'B' : [':Buffers'        , 'open buffers']       ,
          \ 'c' : [':Commits'        , 'commits']            ,
          \ 'C' : [':BCommits'       , 'buffer commits']     ,
          \ 'f' : [':Files'          , 'files']              ,
          \ 'g' : [':GFiles'         , 'git files']          ,
          \ 'G' : [':GFiles?'        , 'modified git files'] ,
          \ 'h' : [':Helptags'       , 'help documentation'] ,
          \ 'H' : {
              \ 'name': '+history'   ,
              \ 'h'   : [':History'  , 'file history']       ,
              \ 'H'   : [':History:' , 'command history']    ,
              \ }                    ,
          \ 'l' : [':Lines'          , 'lines']              ,
          \ 'm' : [':Marks'          , 'marks']              ,
          \ 'M' : [':Maps'           , 'normal maps']        ,
          \ 'p' : [':Helptags'       , 'help tags']          ,
          \ 'P' : [':Tags'           , 'project tags']       ,
          \ 's' : [':Snippets'       , 'snippets']           ,
          \ 'S' : [':Colors'         , 'color schemes']      ,
          \ 't' : [':Rgrep'          , 'search text']        ,
          \ 'T' : [':BTags'          , 'buffer tags']        ,
          \ 'w' : [':Windows'        , 'search windows']     ,
          \ 'y' : [':Filetypes'      , 'file types']         ,
          \ 'z' : [':FZF'            , 'FZF']                ,
          \ 'j' : [':AnyJump'        , 'show references']    ,
          \ }
    let g:which_key_map.v = {
          \ 'name' : '+vimrc'                 ,
          \ 's'    : [':source $MYVIMRC'      , 'source $MYVIMRC']              ,
          \ 'e'    : [':edit $MYVIMRC'        , 'edit $MYVIMRC']                ,
          \ 'o'    : [':botright vs $MYVIMRC' , 'edit $MYVIMRC (bottom right)'] ,
          \ }
    let g:which_key_map.a = {
          \ 'name' : '+action'                 ,
          \ 'l'    : ['CocList'                , 'coc-list']              ,
          \ 'u'    : ['UndotreeToggle'         , 'undo tree']             ,
          \ 'c'    : ['set concealcursor = ""' , 'disable concealcursor'] ,
          \ 'd'    : [':windo diffthis'        , 'vimdiff (diffthis)']    ,
          \}
    let g:which_key_map.t = {
        \ 'name' : '+terminal'                             ,
        \ ';' : [':FloatermNew --wintype=popup --height=6' , 'new small']  ,
        \ 'n' : [':FloatermNew'                            , 'new normal'] ,
        \ 't' : [':FloatermToggle'                         , 'toggle']     ,
        \ 'k' : [':FloatermKill'                           , 'kill']       ,
        \ 'f' : [':FloatermNew fzf'                        , 'fzf']        ,
        \ 'p' : [':FloatermNew python'                     , 'python']     ,
        \ 'r' : [':FloatermNew ranger'                     , 'ranger']     ,
        \ }
    " l is for language server protocol
    let g:which_key_map.l = {
          \ 'name' : '+lsp' ,
          \ '.' : [':CocConfig'                          , 'config'],
          \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
          \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
          \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
          \ 'b' : [':CocNext'                            , 'next action'],
          \ 'B' : [':CocPrev'                            , 'prev action'],
          \ 'c' : [':CocList commands'                   , 'commands'],
          \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
          \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
          \ 'e' : [':CocList extensions'                 , 'extensions'],
          \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
          \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
          \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
          \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
          \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
          \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
          \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
          \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
          \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
          \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
          \ 'O' : [':CocList outline'                    , 'outline'],
          \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
          \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
          \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
          \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
          \ 'R' : ['<Plug>(coc-references)'              , 'references'],
          \ 's' : [':CocList -I symbols'                 , 'symbols'],
          \ 'S' : [':CocList snippets'                   , 'snippets'],
          \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
          \ 'u' : [':CocListResume'                      , 'resume list'],
          \ 'U' : [':CocUpdate'                          , 'update CoC'],
          \ 'v' : [':Vista!!'                            , 'tag viewer'],
          \ 'z' : [':CocDisable'                         , 'disable CoC'],
          \ 'Z' : [':CocEnable'                          , 'enable CoC'],
          \ }

    " floating window
    let g:which_key_use_floating_win = 0
    " Change the colors if you want
    highlight default link WhichKey          Operator
    highlight default link WhichKeySeperator DiffAdded
    highlight default link WhichKeyGroup     Identifier
    highlight default link WhichKeyDesc      Function
    " ignore key <leader>1
    " let g:which_key_map.1 = 'which_key_ignore'
endif
" }}}

" ----------------------------
" Plug 'voldikss/vim-floaterm' {{{
" notice: by installing: `pip3 install neovim-remote`, `floaterm xxx` will open text file in current neovim instance
" ----------------------------
if dein#tap('vim-floaterm')
    let g:floaterm_shell = "$SHELL"
    " 'floating'(neovim) or 'popup'(vim) by default.
    " let g:floaterm_wintype = 'normal'
    " let g:floaterm_wintitle = v:true
    let g:floaterm_width = 0.7
    let g:floaterm_height = 0.7
    " let g:floaterm_position = 'center'
    " open floating window in project dir
    let g:floaterm_rootmarkers = ['.project', '.git', 'package.json', 'node_modules', '.hg', '.svn', '.root', '.gitignore']
    let g:floaterm_autoinsert = v:true
    " 0: not close, 1: not close when abnormal, 2: always close
    let g:floaterm_autoclose = 0

    " nnoremap <sttilent> <Leader>tt   :FloatermNew<CR>
    " tnoremap <silent> <Leader>tt   <C-\><C-n>:FloatermNew<CR>
    nnoremap <silent> <Leader>tp   :FloatermPrev<CR>
    tnoremap <silent> <Leader>tp   <C-\><C-n>:FloatermPrev<CR>
    nnoremap <silent> <Leader>tn   :FloatermNext<CR>
    tnoremap <silent> <Leader>tn   <C-\><C-n>:FloatermNext<CR>
    nnoremap <silent> <Leader>tt  :FloatermToggle<CR>
    tnoremap <silent> <Leader>tt  <C-\><C-n>:FloatermToggle<CR>
    nnoremap <silent> <Leader>tk  :FloatermKill<CR>
    tnoremap <silent> <Leader>tk  <C-\><C-n>:FloatermKill<CR>

    " Set floaterm window's background to black
    " hi Floaterm guibg=black
    " Set floating window border line color to cyan, and background to orange
    " hi FloatermBorder guibg=orange guifg=cyan
endif
" }}}

" --------------------------
" Plug 'airblade/vim-rooter' {{{
" --------------------------
if dein#tap('vim-rooter')
    " project-root pattern( / represents for directory)
    let g:rooter_patterns = ['.git', '.git/', 'svn/', 'node_modules/']
    " for non-project files,change to current file's directory
    let g:rooter_change_directory_for_non_project_files = 'current'
    " trigger vim-rooter: directories and all files (default)
    let g:rooter_targets = '/,*'
    " disable changing directory automatically
    let g:rooter_manual_only = 1
    " echoing the project directory
    let g:rooter_silent_chdir = 0
    " resolve symbolic links
    let g:rooter_resolve_links = 1
    " When Rooter changes the working directory it emits the autocmd user event RooterChDir
    " autocmd User RooterChDir call s:setProjectDir(FindRootDirectory())
endif
" }}}

" ------------------------
" Plug 'godlygeek/tabular' {{{
" ------------------------
if dein#tap('tabular')
    nnoremap <Leader>tb :<C-u>Tabularize /
    vnoremap <Leader>tb :Tabularize /
endif
" }}}


" =========================
" Plug 'honza/vim-snippets' {{{
" =========================
if dein#tap('vim-snippets')
    " Use <C-l> for trigger snippet expand.
    inoremap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vnoremap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
endif
" }}}

" ============================
" Plug 'pechorin/any-jump.vim' {{{
" ============================
if dein#tap('any-jump.vim')
    " Normal mode: Jump to definition under cursore
    nnoremap <leader>j :AnyJump<CR>

    " Visual mode: jump to selected text in visual mode
    xnoremap <leader>j :AnyJumpVisual<CR>

    " Normal mode: open previous opened file (after jump)
    nnoremap <leader>ab :AnyJumpBack<CR>

    " Normal mode: open last closed search window again
    nnoremap <leader>al :AnyJumpLastResults<CR>
    " Show line numbers in search rusults
    let g:any_jump_list_numbers = 0

    " Auto search references
    let g:any_jump_references_enabled = 1

    " Auto group results by filename
    let g:any_jump_grouping_enabled = 0

    " Amount of preview lines for each search result
    let g:any_jump_preview_lines_count = 5

    " Max search results, other results can be opened via [a]
    let g:any_jump_max_search_results = 10

    " Prefered search engine: rg or ag
    let g:any_jump_search_prefered_engine = 'rg'


    " Search results list styles:
    " - 'filename_first'
    " - 'filename_last'
    let g:any_jump_results_ui_style = 'filename_first'

    " Any-jump window size & position options
    let g:any_jump_window_width_ratio  = 0.6
    let g:any_jump_window_height_ratio = 0.6
    let g:any_jump_window_top_offset   = 4

    " Customize any-jump colors with extending default color scheme:
    let g:any_jump_colors = { "help": "Comment" }

    " Or override all default colors
    let g:any_jump_colors = {
          \"plain_text":         "Comment",
          \"preview":            "Comment",
          \"preview_keyword":    "Operator",
          \"heading_text":       "Function",
          \"heading_keyword":    "Identifier",
          \"group_text":         "Comment",
          \"group_name":         "Function",
          \"more_button":        "Operator",
          \"more_explain":       "Comment",
          \"result_line_number": "Comment",
          \"result_text":        "Statement",
          \"result_path":        "String",
          \"help":               "Comment"
          \}

    " Disable default any-jump keybindings (default: 0)
    let g:any_jump_disable_default_keybindings = 1

    " Remove comments line from search results (default: 1)
    let g:any_jump_remove_comments_from_results = 0

    " Custom ignore files
    " default is: ['*.tmp', '*.temp']
    let g:any_jump_ignored_files = ['*.tmp', '*.temp']

    " Search references only for current file type
    " (default: false, so will find keyword in all filetypes)
    let g:any_jump_references_only_for_current_filetype = 0

    " Disable search engine ignore vcs untracked files
    " (default: false, search engine will ignore vcs untracked files)
    let g:any_jump_disable_vcs_ignore = 0
endif
" }}}


" ------------------
" tpope/vim-dispatch {{{
" ------------------
if dein#tap('vim-dispatch')
    " Foreground builds: :Make
    " Background builds: :Make!
    "                    :Copen to see the build process
    "
    " build python file: :Dispatch python %
    " build by default Dispatch(set by b:dispatch): :Dispatch %
    autocmd FileType java let b:dispatch = 'java %'
    autocmd FileType python let b:dispatch = g:python3_host_prog.' %'
    autocmd FileType javascript let b:dispatch = 'node %'
endif
" }}}

" ------------------
" why8n/enhanceOPM {{{
" ------------------
if dein#tap('enhanceOPM')
    " for tob in ['()', '[]', '{}', '<>', '*', ',']
    "     call enhanceOPM#EOPM(tob)
    " endfor
endif
" }}}

" ------------------
" why8n/autopaste {{{
" ------------------
if dein#tap('autopaste')
    nnoremap <silent> <C-v> :PasteInNormalMode +<CR>
    inoremap <silent> <C-v> <C-o>:PasteInInsertMode +<CR>
    vnoremap <silent> <C-v> :<C-u>PasteInVisualMode +<CR>
    cnoremap <C-v> <C-r>+
endif
" }}}

" --------------------
" frazrepo/vim-rainbow {{{
" --------------------
if dein#tap('vim-rainbow')
    let g:rainbow_active = 1
    let g:rainbow_load_separately = [
        \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
        \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
        \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
        \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
        \ ]

    let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
    let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
endif
" }}}
