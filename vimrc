augroup MyAutoCmd
    autocmd!
augroup END



" NeoBundle
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {'build' :
            \      {
            \              'windows'    : 'make -f make_mingw32.mak',
            \              'cygwin'     : 'make -f make_cygwin.mak',
            \              'mac'        : 'make -f make_mac.mak',
            \              'unix'       : 'make -f make_unix.mak',
            \      },
            \   }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'othree/html5.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundleLazy 'AutoClose',              {'autoload' : {'insert' : 1}}
NeoBundleLazy 'Shougo/neocomplete.vim', {'autoload' : {'insert' : 1}}
NeoBundleLazy 'mattn/emmet-vim',        {'autoload' : {'insert' : 1}}

filetype plugin indent on

NeoBundleCheck



" emmet-vim
let g:user_emmet_settings={'lang':'ja'}



" neocomplete.vim
let s:hooks=neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup=0
    let g:neocomplete#enable_at_startup=1
    let g:neocomplete#enable_smart_case=1
    let g:neocomplete#sources#syntax#min_keyword_length=3
endfunction



" vim-quickrun
let g:quickrun_config={
            \   "_" : {
            \           "hook/close_buffer/enable_empty_data"    : 1,
            \           "hook/close_buffer/enable_failure"       : 1,
            \           "hook/close_quickfix/enable_hook_loaded" : 1,
            \           "hook/close_quickfix/enable_success"     : 1,
            \           "outputter"                              : "multi:buffer:quickfix",
            \           "runner"                                 : "vimproc",
            \           "runner/vimproc/updatetime"              : 100,
            \   }
            \ }



" key mappings
cnoremap <expr>   /          getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr>   ?          getcmdtype() == '?' ? '\?' : '?'
inoremap <expr>   <Tab>      pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <silent> <Esc><Esc> :nohlsearch <CR>
nnoremap n      nzz
nnoremap N      Nzz
nnoremap *      *zz
nnoremap #      #zz
nnoremap g*     g*zz
nnoremap g#     g#zz



" others
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd MyAutoCmd       QuickFixCmdPost make            copen



" options
" 基本:
" |quickref|      よく使うコマンドのクイックリファレンス
set cursorline
set expandtab
set noerrorbells
set novisualbell
set splitright

" |tutor|         30分の初心者向けトレーニングコース
" |copying|       著作権について
" |iccf|          ウガンダの恵まれない子供達への支援活動
" |sponsor|       Vim 開発スポンサー制度、Vim の登録ユーザーになろう
" |www|           インターネット上の Vim 情報
" |bugs|          バグレポートの送信先
"
" ユーザーマニュアルでは編集作業の進め方を説明します。
"
" |usr_toc.txt|   ユーザーマニュアル目次
"
" 初級編
" done: |usr_01.txt|  マニュアルについて
" done: |usr_02.txt|  初めての Vim
set showmode

" done: |usr_03.txt|  カーソルの移動
set hlsearch
set ignorecase
set incsearch
set matchpairs+=<:>
set nonumber
set ruler
set scrolloff=5
set wrapscan

" done: |usr_04.txt|  簡単な編集
" |usr_05.txt|  設定の変更
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
set backspace=indent,eol,start
set cmdheight=1
set list
set listchars=tab:>-,trail:-
set showcmd
set whichwrap=b,s,<,>,[,]

" |usr_06.txt|  構文強調表示
set background=dark
set t_Co=256
colorscheme zenburn
syntax enable

" |usr_07.txt|  複数のファイルを開く
" |usr_08.txt|  ウィンドウの分割
set laststatus=2

" |usr_09.txt|  GUI を使う
" |usr_10.txt|  大規模な編集
set shiftwidth=4

" |usr_11.txt|  クラッシュからの復帰
" |usr_12.txt|  便利な小技
" 
" 上級編
" |usr_20.txt|  コマンドラインを素早く入力する
set wildmode=list:longest

" |usr_21.txt|  中断と再開
" |usr_22.txt|  ファイルを探す
" |usr_23.txt|  特殊なファイルを編集する
" |usr_24.txt|  素早く入力する
set infercase

" |usr_25.txt|  テキストの整形
set tabstop=8

" |usr_26.txt|  繰り返し
" |usr_27.txt|  検索コマンドと正規表現
set smartcase

" |usr_28.txt|  折り畳み
" |usr_29.txt|  プログラムの中を移動する
" |usr_30.txt|  プログラムの編集
set smarttab

" |usr_31.txt|  GUI を活用する
" |usr_32.txt|  undo ツリー
" 
" カスタマイズ
" |usr_40.txt|  新しいコマンドを作る
" |usr_41.txt|  Vim スクリプト書法
let mapleader=','

" |usr_42.txt|  新しいメニューを追加する
" |usr_43.txt|  ファイルタイプを使う
" |usr_44.txt|  構文ファイルを作成する
" |usr_45.txt|  言語を選択する
" 
" インストール
" |usr_90.txt|  Vim のインストール
" 
" 
" リファレンスマニュアルでは Vim の詳細を説明します。             *reference_toc*
" 
" 一般事項
" |intro.txt|     Vimについての前書き。と、ヘルプの表記について
" |help.txt|      全体説明とクイックリファレンス (今見ているファイル)
" |helphelp.txt|  ヘルプの使い方
" |index.txt|     全コマンド一覧。アルファベット順
" |help-tags|     ジャンプできるタグ一覧
" |howto.txt|     一般的な編集操作についてのHow to
" |tips.txt|      さまざまなTips
" |message.txt|   (エラー)メッセージの説明
" |quotes.txt|    Vimユーザーの感想
" |todo.txt|      既知のバグと、機能拡張の要望
" |debug.txt|     Vimのデバッグについて
" |develop.txt|   Vimの開発に関して
" |uganda.txt|    Vimの配布条件と、あなたが支払ったお金の使い道について
" 
" 基本的な編集
" |starting.txt|  Vimの起動。起動引数や初期化に関して
" |editing.txt|   ファイルの編集と保存
" |motion.txt|    移動コマンド
" |scroll.txt|    ウィンドウのスクロール
" |insert.txt|    挿入モードと置換モード
" |change.txt|    テキストの削除と変更
set shiftround

" |indent.txt|    C言語や、その他の言語の自動インデント
" |undo.txt|      アンドゥとリドゥ
" |repeat.txt|    繰り返しコマンド、Vimスクリプト、スクリプトのデバッグ
" |visual.txt|    ビジュアルモード (テキストの選択)
" |various.txt|   その他の様々なコマンド
" |recover.txt|   クラッシュからの復帰
" 
" 高度な編集
" |cmdline.txt|   コマンドラインの編集
" |options.txt|   全オプションの説明
" |pattern.txt|   検索コマンドと正規表現
" |map.txt|       キーマップと短縮入力
" |tagsrch.txt|   タグと特別な検索
" |quickfix.txt|  編集、コンパイル、修正、の流れを早くするコマンド
" |windows.txt|   マルチウィンドウとマルチバッファのコマンド
" |tabpage.txt|   タブページを操作するコマンド
" |syntax.txt|    構文強調
" |spell.txt|     スペルチェック
" |diff.txt|      バージョン違いのファイルの編集。差分モード
" |autocmd.txt|   イベントに応じて自動的にコマンドを実行する
" |filetype.txt|  ファイルタイプ別の設定
" |eval.txt|      式の評価。条件式。 (Vim スクリプトリファレンス)
" |fold.txt|      ある範囲を隠す (折り畳む)
" 
" 特定機能
" |print.txt|     印刷
" |remote.txt|    クライアント/サーバー機能
" |term.txt|      いろいろな端末やマウスについて
" |digraph.txt|   利用可能なダイグラフ (digraph) の一覧
" |mbyte.txt|     マルチバイトテキストのサポート
" |mlang.txt|     英語以外の言語のサポート
" |ft_ada.txt|    Ada (プログラミング言語) のサポート
" |ft_sql.txt|    SQL ファイルタイププラグイン
" 
" 拡張インターフェース
" |if_cscop.txt|  cscopeを使う
" |if_lua.txt|    Lua インターフェース
" |if_mzsch.txt|  MzScheme インターフェース
" |if_perl.txt|   Perl インターフェース
" |if_pyth.txt|   Python インターフェース
" |if_sniff.txt|  SNiFF+ インターフェース
" |if_tcl.txt|    Tcl インターフェース
" |if_ole.txt|    Win32のOLEオートメーション
" |if_ruby.txt|   Ruby インターフェース
" |debugger.txt|  デバッガ用のインターフェース
" |workshop.txt|  Sun Visual Workshop インターフェース
" |netbeans.txt|  NetBeans External Editor インターフェース
" |sign.txt|      デバッグ用の目印
" 
" *standard-plugin-list*
" 標準プラグイン
" |pi_getscript.txt| Vim スクリプトの最新版をダウンロードする
" |pi_gzip.txt|      圧縮ファイルの読み書き
" |pi_netrw.txt|     ネットワークファイルの読み書き
" |pi_paren.txt|     対括弧の強調表示
" |pi_tar.txt|       Tar ファイルエクスプローラ
" |pi_vimball.txt|   Vim スクリプトインストーラを作成する
" |pi_zip.txt|       Zip アーカイブエクスプローラ
" 
" その他
" |vim_faq.txt|   FAQ
