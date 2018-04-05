Date: 2018-04-04
Title: Emacs
Author: Michael Olberg and Franz Kirsten
Tags: emacs

# Emacs

A short introduction to `emacs` given as part of the tech talk series.

> "Emacs outshines all other editing software in approximately the same
> way that the noonday sun does the stars. It is not just bigger and
> brighter; it simply makes everything else vanish." -Neal Stephenson,
> "In the Beginning was the Command Line"

<!--quoteend-->

> "Show me your ~/.emacs and I will tell you who you are." - Bogdan Maryniuk

<!--quoteend-->

> "Emacs is like a laser guided missile. It only has to be slightly
> mis-configured to ruin your whole day." -Sean McGrathi

<!--quoteend-->

> "While any text editor can save your files, only Emacs can save your soul." -Per Abrahamseni

The home page of GNU Emacs is [here](https://www.gnu.org/software/emacs/), which also takes you to the
download area. A good book describing `emacs` is [Mastering Emacs](https://www.masteringemacs.org/). A
number of tutorials are found at [ErgoEmacs](http://ergoemacs.org/emacs/emacs.html). Please also have a look at
the [EmacsWiki](https://www.emacswiki.org/) for a lot of useful information. Finally, Sacha Chua
usually has a lot of interesting news about `emacs` on her
[blog](http://sachachua.com). Wikipedia has a compilation of differences between `emacs` and
`vim` on their page [Editor war](https://en.wikipedia.org/wiki/Editor_war).


## Configuration {#configuration}

The configuration of emacs is usually in `$HOME/.emacs` or
`$HOME/.emacs.d/init.el`. Here are a couple of things which I use
personally:

-   Make emacs start up without menu bar, tool bar or scroll bar:

```
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; turn transient mark mode on
(transient-mark-mode 1)
;; define my location for emacs calendar
(setq-default european-calendar-style t)
(setq calendar-latitude 57.4)
(setq calendar-longitude 11.9)
(setq calendar-location-name "Onsala, SE")
```

-   Customize modes:

```
(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'case-label 2)
  (c-set-offset 'statement-case-intro 2)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'tex-mode-hook #'(lambda () (setq ispell-parser 'tex)))
```

-   Define your own functions:

```
(defun insert-datetime (arg)
  "Without argument: insert date as yyyy-mm-dd
With C-u: insert time
With C-u C-u: insert date and time"
  (interactive "P")
  (cond ((equal arg '(4)) (insert (format-time-string "%T")))
	((equal arg '(16)) (insert (format-time-string "%Y-%m-%d %T")))
	(t (insert (format-time-string "%Y-%m-%d")))))
```

-   Use emacs built-in customization

```
M-x customize
```


## Packages {#packages}

-   Configure package repository:

```
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	   '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
 (unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; example: package magit
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))
```

-   Install additional packages:

```
M-x package-refresh-contents
M-x packagae-install<TAB>
```


## Windows {#windows}

-   I.e. what emacs means by that ;)

```
C-x 2 split vertically
C-x 3 split horizontally
C-x o goto next window
C-x 1 keep only current window
C-x 0 kill current window
C-x C-b show list of buffers
C-x b switch buffer
C-x d enter dired mode
```


## Search and replace {#search-and-replace}

-   Incremental search

```
C-s isearch-forward
C-r isearch-backward
C-w yank (i.e. paste) word at point onto end of search string
```

-   Query and replace (note emacs is case insensitive by default!)

```
M-% query-replace           ;; will prompt for from-string and to-string
C-M-% query-replace-regexp  ;; same for regualr expressions
```


## Macros {#macros}

-   Define and execute macros, use counters which self-increment on each execution

```
C-x (        ;; start macro definition
C-x )        ;; end macro definition
C-x e        ;; execute macro
e            ;; execute again
C-x C-k C-c  ;; set counter
C-x C-k C-i  ;; insert counter (or use F3)
C-x C-k C-a  ;; add to counter
```

## Rectangle mode {#rectangle-mode}

-   Work with rectangular text areas, defined by the beginning of the
    region and current cursor position (what emacs calls
    "point"). Note, that highlighting will typically extend beyond the
    rectangle.

```
;; mark region which will define a rectangle
C-x r t      ;; will prompt for string to replace rectangle
C-x r k      ;; kill rectangle
C-x r y      ;; yank (i.e. paste) rectangle
```


## Help {#help}

-   Get help on mode, variables and key shortcuts

```
M-x describe-mode
M-x describe-variable
M-x describe-key
```


## Franz's configuration {#franz-s-configuration}

-   To enable `tabbar` mode you need to install `emacs-goodies-el` via
    `apt-get` or the like. One way to set it up is described
    [here](https://stackoverflow.com/questions/3811126/do-you-use-emacs-tabbar).

-   The description of how to get Python syntax checking to work in
    `emacs` is
    [here](http://docs.astropy.org/en/stable/development/codeguide_emacs.html).

-   And [here](http://tkf.github.io/emacs-jedi/latest/#install) is a
    manual on how to install `jedi` in `emacs`, provides code auto
    completion and on-the-fly help.

-   One more thing I forgot to add: By default `emacs` does not scroll
    smoothly but in steps of xx-lines -- I hate it. To have smooth
    scrolling starting when you're 5 lines away from the bottom/top of
    the page add the following to your configuration (requires package
    `smooth-scroling`):

```
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)
```
