;; For macbook pro retina

;; shell
(setq explicit-shell-file-name "bash")
(setq shell-file-name "sh")
(setq shell-command-switch "-c")

;; to use spaces for auto-indent.
(setq-default indent-tabs-mode nil)

;; local emacs files
(add-to-list 'load-path "~/.emacs.d/elisp")

;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; 英語
(set-face-attribute 'default nil
             :family "Menlo" ;; font
             :height 100)    ;; font size

;; 日本語
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;   (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2に
(setq face-font-rescale-alist
      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)));; Mac用フォント設定

;;markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;change fore-ground/back-ground

(custom-set-faces
 '(default ((t
             (:background "black" :foreground "white")
             ))))
 '(cursor ((((class color)
             (background dark))
            (:Background "#00AA00"))
           (((class color)
             (background light))
            (:background "#999999"))
           (t ())
           ))

;ruby
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)))

(setq ispell-program-name "aspell"); ispell の代わりに aspell を使う
(setq ispell-grep-command "grep"); デフォルトの egrep が Cygwin ではシンボリックリンク
(eval-after-load "ispell"
 '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; タブの幅の設定
(setq default-tab-width 4)

;;; 日本語環境設定
(set-language-environment "Japanese")

;; バックアップファイルの作成場所を固定
(setq make-backup-files t)
(setq backup-directory-alist
(cons (cons "\\.*$" (expand-file-name "~/.emacs.d/back"))
backup-directory-alist))

;;toolbar unvisible
;(tool-bar-mode -1)

;; グローバルキーの設定
(global-set-key [?\C-h] 'backward-delete-char)
(global-set-key [?\M-?] 'help-for-help)
(global-set-key [?\C-/] 'undo)
(global-set-key [?\C-\¥] 'compile)
(global-set-key [?\C-o] 'toggle-input-method)

;; リージョンのハイライト
(transient-mark-mode 1)

;; 最終行で改行無効
(setq next-line-add-newlines nil)

;; フェイスの変更
;(set-face-foreground 'modeline "black")
;(set-face-background 'modeline "gray40")

;; 対応する括弧をハイライト表示
(setq show-paren-mode t)

;;yatex
(setq auto-mode-alist
(cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/yatex") load-path))
(setq tex-command "/usr/texbin/platex")
;; you can convert dvi2pdf with c-c c-t c-l
(setq dviprint-command-format "dvipdfmx %s")
;;(setq dvi2-command "open -n /Application/Preview.app")
(setq dvi2-command "open -a Preview")

;; 列数の表示 (文献 3 「個人環境設定」の項目を参照)
(column-number-mode 1)

;; リージョン部を入力で置き換える
(delete-selection-mode t)

;;; マウスカーソルを消す設定
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;;xcscope
(require 'xcscope)
(global-set-key "\C-css" 'cscope-find-this-symbol)
(global-set-key "\C-csd" 'cscope-find-global-definition)
(global-set-key "\C-csg" 'cscope-find-global-definition)
(global-set-key "\C-csG" 'cscope-find-global-definition-no-prompting)
(global-set-key "\C-csc" 'cscope-find-functions-calling-this-function)
(global-set-key "\C-csC" 'cscope-find-called-functions)
(global-set-key "\C-cst" 'cscope-find-this-text-string)
(global-set-key "\C-cse" 'cscope-find-egrep-pattern)
(global-set-key "\C-csf" 'cscope-find-this-file)
(global-set-key "\C-csi" 'cscope-find-files-including-file)
;; --- (The '---' indicates that this line corresponds to a menu separator.)
(global-set-key "\C-csb" 'cscope-display-buffer)
(global-set-key "\C-csB" 'cscope-display-buffer-toggle)
(global-set-key "\C-csn" 'cscope-next-symbol)
(global-set-key "\C-csN" 'cscope-next-file)
(global-set-key "\C-csp" 'cscope-prev-symbol)
(global-set-key "\C-csP" 'cscope-prev-file)
(global-set-key "\C-csu" 'cscope-pop-mark)
;; ---
(global-set-key "\C-csa" 'cscope-set-initial-directory)
(global-set-key "\C-csA" 'cscope-unset-initial-directory)
;; ---
(global-set-key "\C-csL" 'cscope-create-list-of-files-to-index)
(global-set-key "\C-csI" 'cscope-index-files)
(global-set-key "\C-csE" 'cscope-edit-list-of-files-to-index)
(global-set-key "\C-csW" 'cscope-tell-user-about-directory)
(global-set-key "\C-csS" 'cscope-tell-user-about-directory)
(global-set-key "\C-csT" 'cscope-tell-user-about-directory)
(global-set-key "\C-csD" 'cscope-dired-directory)

;; ¥マークをバックスラッシュにする
(define-key global-map [?¥] [?\\])

;; 画面端でカーソルを一行だけスクロール
(setq scroll-conservatively 1)

;; ビープ音を鳴らさない
(setq visible-bell t)

;; current directory
(cd "~/")

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)

(set-default-coding-systems 'utf-8)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
