setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep を無効にする
setopt no_flow_control      # フローコントロールを無効にする
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_cd              # ディレクトリ名だけでcdする
setopt auto_pushd           # cd したら自動的にpushdする
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt equals
setopt magic_equal_subst    # = の後はパス名として補完する
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_save_nodups     # ヒストリから重複したコマンドがあったら古い方を削除する
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt auto_menu            # 補完候補が複数あるときに自動的に一覧表示する
setopt prompt_subst         # プロンプト定義内で変数置換やコマンド置換を扱う
setopt list_types           # 補完候補一覧でファイルの種別をマーク表示
setopt auto_list            # 補完候補を一覧表示
setopt list_packed          # 補完候補を詰めて表示
# setopt auto_param_keys      # カッコの対応などを自動的に補完
setopt noautoremoveslash    # 最後のスラッシュを自動的に削除しない
setopt notify               # バックグラウンドジョブの状態変化を即時報告
setopt share_history
setopt combining_chars      # 補完時，全角特殊文字をきちんと表示
setopt complete_aliases     # alias もガッツリ保管
