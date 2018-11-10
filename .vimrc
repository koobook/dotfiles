"
"　　　　                  ..
"　　　　                .::::.
"　　　　   ___________ :;;;;:`____________
"　　　　   \_________/ ?????L \__________/
"　　　　     |.....| ????????> :.......'
"　　　　     |:::::| $$$$$$"`.:::::::' ,
"　　　　    ,|:::::| $$$$"`.:::::::' .OOS.
"　　　　  ,7D|;;;;;| $$"`.;;;;;;;' .OOO888S.
"　　　　.GDDD|;;;;;| ?`.;;;;;;;' .OO8DDDDDNNS.
"　　　　 'DDO|IIIII| .7IIIII7' .DDDDDDDDNNNF`
"　　　　   'D|IIIIII7IIIII7' .DDDDDDDDNNNF`
"　　　　     |EEEEEEEEEE7' .DDDDDDDNNNNF`
"　　　　     |EEEEEEEEZ' .DDDDDDDDNNNF`
"　　　　     |888888Z' .DDDDDDDDNNNF`
"　　　　     |8888Z' ,DDDDDDDNNNNF`
"　　　　     |88Z'    "DNNNNNNN"
"　　　　     '"'        "MMMM"
"　　　　                  ""
"

set number " 行番号を表示
set fenc=utf-8 " 文字コードをUFT-8に設定
set encoding=utf-8
set fileencoding=utf-8
set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない
set showcmd " 入力中のコマンドをステータスに表示する
set mouse=a " マウス操作を有効にする
set backspace=indent,eol,start " backspaceを有効にする
set smartindent " スマートインデント
set showmatch " 対応する括弧を強調
set expandtab " Tab文字を半角スペースにする
set tabstop=3 " 行頭以外のTab文字の表示幅
set shiftwidth=3 " 行頭でのTab文字の表示幅
set wildmode=list:longest " コマンドラインの補完

" statusline
set statusline=%F " ファイル名表示
set statusline+=%m " 変更チェック表示
set statusline+=%r " 読み込み専用かどうか表示
set statusline+=%h " ヘルプページなら[HELP]と表示
set statusline+=%w " プレビューウインドウなら[Prevew]と表示
set statusline+=%= " これ以降は右寄せ表示
set statusline+=%l/%L " 現在行数/全行数
set laststatus=2 " ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
