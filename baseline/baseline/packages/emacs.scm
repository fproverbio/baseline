(define-module (baseline packages emacs)
  #:use-module (guix download)
  ;; #:use-module (guix utils)
  ;; #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system r)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages cran)
  ;; #:use-module (flat packages gcc)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages video)
  ;; #:use-module (gnu packages webkit)
  ;; #:use-module (gnu packages gnome)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages emacs-xyz)
  ;; #:use-module (gnu packages emacs)
  #:use-module ((guix licenses) #:prefix license:))

;; (define-public emacs-next-pgtk-native-comp
;;   (package
;;     (inherit emacs-next-pgtk)
;;     (name "emacs-next-pgtk-native-comp")
;;     (arguments
;;      (substitute-keyword-arguments (package-arguments emacs-next)
;;        ((#:configure-flags flags #~'())
;;         #~(cons* "--with-native-compilation" #$flags))))
;;     (propagated-inputs
;;      (list gsettings-desktop-schemas glib-networking libgccjit-11))
;;     (inputs
;;      (modify-inputs (package-inputs emacs-next)
;;        (prepend webkitgtk-with-libsoup2)))
;;     (home-page "https://github.com/masm11/emacs")
;;     (synopsis "Emacs text editor with @code{pgtk} and @code{xwidgets} support")
;;     (description "This Emacs build implements graphical UI purely in terms of
;; GTK and also enables xwidgets.")))

(define-public emacs-circadian
  (package
   (name "emacs-circadian")
   (version "0.3.2")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/guidoschmidt/circadian.el")
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0wpsykmai3idz0bgfl07hwl9nr4x9sgprvqgw8jln4dz2wf5gdic"))))
   (build-system emacs-build-system)
   (home-page "https://guidoschmidt.github.io/circadian.el/")
   (synopsis "theme-switching for emacs based on daytime")
   (description
    "Circadian tries to help reducing eye strain that may arise from difference of your display brightness and the surrounding light.
Inspired by color temperature shifting tools and brightness adaption software like redshift, f.lux and Lumen.")
   (license license:gpl3+)))

(define-public emacs-nano-modeline
  (package
   (name "emacs-nano-modeline")
   (version "0.5")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/nano-modeline-"
           version
           ".tar"))
     (sha256
      (base32 "0f6xgrxykd5jmlzf9xmywh0jc2jfq698m4nqk60h40dm6pi0gfi2"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/rougier/nano-modeline")
   (synopsis "N Λ N O modeline")
   (description
    "Nano modeline is a minor mode that modify the modeline as: [ prefix | name
(primary)                      secondary ]

It can be displayed at the bottom (mode-line) or at the top (header-line)
depending on nano-modeline-position custom setting.
\nThere are two sets of faces (for active and inactive modelines) that can be
customized (M-x: customize-group + nano-modeline)

- nano-modeline-active-name      / nano-modeline-inactive-name -
nano-modeline-active-primary   / nano-modeline-inactive-primary -
nano-modeline-active-secondary / nano-modeline-inactive-secondary -
nano-modeline-active-status-RO / nano-modeline-inactive-status-RO -
nano-modeline-active-status-RW / nano-modeline-inactive-status-RW -
nano-modeline-active-status-** / nano-modeline-inactive-status-**

Usage example:

M-x: nano-modeline-mode")
   (license license:gpl3+)))

(define-public emacs-nano-theme
  (package
   (name "emacs-nano-theme")
   (version "0.3.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/nano-theme-"
           version
           ".tar"))
     (sha256
      (base32 "1nq5x46467vnsfg3fzb0qyg97xpnwsvbqg8frdjil5zq5fhsgmrz"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/rougier/nano-theme")
   (synopsis "N Λ N O theme")
   (description
    "N Λ N O theme is a consistent theme that comes in two flavors:  - a light theme
that is based on Material (https://material.io/)  - a dark theme that is based
on Nord (https://www.nordtheme.com/).

A theme is fully defined by a set of (1+6) faces as explained in this paper
https://arxiv.org/abs/2008.06030:

- Default face is the face for regular information.

- Critical face is for information that requires immediate action.

    It should be of high constrast when compared to other     faces.  This can
be realized (for example) by setting an intense     background color, typically
a shade of red.  It must be used     scarcely.

- Popout face is used for information that needs attention.

    To achieve such effect, the hue of the face has to be     sufficiently
different from other faces such that it attracts     attention through the
popout effect.

- Strong face is used for information of a structural nature.

    It has to be the same color as the default color and only the     weight
differs by one level (e.g., light/regular or     regular/bold).  IT is generally
used for titles, keywords,     directory, etc.

- Salient face is used for information that are important.

    To suggest the information is of the same nature but important,     the face
uses a different hue with approximately the same     intensity as the default
face.  This is typically used for     links.

- Faded face is for information that are less important.

    It is made by using the same hue as the default but with a     lesser
intensity than the default.  It can be used for comments,     secondary
information and also replace italic (which is     generally abused anyway

- Subtle face is used to suggest a physical area on the screen.

    It is important to not disturb too strongly the reading of     information
and this can be made by setting a very light     background color that is barely
perceptible.


Usage example:

You can use the theme as a regular theme or you can call (nano-light) /
(nano-dark) explicitely to install the light or dark version.

With GUI, you can mix frames with light and dark mode.  Just call
(nano-new-frame 'light) or (nano-new-frame 'dark)

Optionally, you can use (nano-mode) to setup recommended settings for the theme.
 Be careful since it will modify your configuration and requires a set of
specific fonts.  This needs to be called before setting the theme

Recommended font is \"Roboto Mono\" or \"Roboto Mono Nerd\" if you want to benefit
from all the fancy glyphs.  See https://www.nerdfonts.com.")
   (license license:gpl3+)))

(define-public emacs-nano-agenda
  (package
   (name "emacs-nano-agenda")
   (version "0.2.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/nano-agenda-"
           version
           ".tar"))
     (sha256
      (base32 "0j29fwc273mjdlj83h1a46sb7z3j066qqnp2i78kn2pmgjg27szb"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/rougier/nano-agenda")
   (synopsis "N Λ N O agenda")
   (description
    "N Λ N O agenda is a minimal view of your org agenda files.  It displays a
calendar view of current month (or the month corresponding to the current
selected date) alongside a view of your agenda displaying timestamped entries.
The agenda can be navigated using arrows keys and killed using \"q\", \"return\" or
\"escape\".

Usage example:

M-x: nano-agenda")
   (license license:gpl3+)))

(define-public emacs-ytel
  (let ((commit "d40bc7ead8d4d7e4d16b03b66a93d63bef51cc5f")
	(revision "1"))
    (package
     (name "emacs-ytel")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/grastello/ytel")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"0pxzfsxzrpv59dssrgx2mmwkm6rzk49ffjkgsa3wks7rdyfil3kf"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/grastello/ytel")
     (synopsis "Youtube \"front-end\" for Emacs")
     (description "ytel is an experimental YouTube \"frontend\" for Emacs. It's goal is to allow the user to collect the results of a YouTube search in an elfeed-like buffer and then manipulate them with Emacs Lisp. The gif below shows that ytel can be used to play videos in an external player, to learn how to emulate it refer to the usage section below.")
     (license license:gpl3+))))

;; learned how to do branches i guess
(define-public emacs-ytel/pablobc-mx
  (let ((commit "9db116efe995f2605a170038326ddef6dc5b599a")
	(branch "dev"))
    (package
     (inherit emacs-ytel)
     (version (git-version "+" branch commit))
     (name "emacs-ytel-pablobc-mx")
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/pablobc-mx/ytel/tree/dev")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "150ghsr0psk8y6yk3nb0wp3vn9r4hnmlx32pm49wg6nh3fns3b6x"))))
     (synopsis "placeholder")
     (description "placeholder")
     (home-page "https://github.com/pablobc-mx/ytel/tree/dev")
     (license license:gpl3+))))     

(define-public emacs-eva
  (package
   (name "emacs-eva")
   (version "0.3.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/meedstrom/eva")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "13l1chz9d1ybcj50g9kax6ha5a3dph73d2j89hzr7viww91r6bnl"))))
   (build-system emacs-build-system)
   (propagated-inputs
    (list r-purrr
	  r-dplyr
	  r-tidyr
	  r-readr
	  r-stringr
	  r-lubridate
	  emacs-transient
	  emacs-ts
	  emacs-named-timer
	  emacs-ess
	  emacs-f
	  emacs-s
	  emacs-pfuture))
   (home-page "https://github.com/meedstrom/eva")
   (synopsis "Emacs-based Virtual Assistant")
   (description "This is an Emacs-based virtual assistant: Eva for short. It helps you with

tracking data about yourself,
presenting some of it back to you,
and getting you to do things.")
   (license license:gpl3+)))

(define-public r-stringr
  (package
   (name "r-stringr")
   (version "1.4.0")
   (source
    (origin
     (method url-fetch)
     (uri (cran-uri "stringr" version))
     (sha256
      (base32 "1p9ip7p87gbbg4s6d3d392svvzz2b5dqdq2c8ilgvn4s78nlsq47"))))
   (properties `((upstream-name . "stringr")))
   (build-system r-build-system)
   (propagated-inputs (list r-glue r-magrittr r-stringi))
   (native-inputs (list r-knitr))
   (home-page "http://stringr.tidyverse.org")
   (synopsis "Simple, Consistent Wrappers for Common String Operations")
   (description
    "This package provides a consistent, simple and easy to use set of wrappers
around the fantastic 'stringi' package.  All function and argument names (and
positions) are consistent, all functions deal with \"NA\"'s and zero length
vectors in the same way, and the output from one function is easy to feed into
the input of another.")
   (license #f)))

(define-public emacs-named-timer
  (let ((commit "d8baeada19b56176c66aed5fa220751e3de11cb8")
	(revision "1"))
    (package
     (name "emacs-named-timer")
     (version "0.1")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/DarwinAwardWinner/emacs-named-timer")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"0xa44mks90xhwkjvrgxll0hzwhkf317i3gxqlajl9cx8v3bhczz1"))))
     (build-system emacs-build-system)
     (home-page "https://github.com/DarwinAwardWinner/emacs-named-timer")
     (synopsis "Simplified timer management for Emacs Lisp")
     (description "This library provides functions for managing named timers. The usual pattern for timer management in Emacs Lisp involves declaring a timer variable, checking it for an existing timer, cancelling that timer if it exists, setting the varaible to nil to indicate that the timer is no longer active, and finally starting a new timer and setting the variable to that value. ")
     (license license:gpl3+))))

;; (define-public emacs-wordel
;;   (let ((commit "c2f0d61646d2744167661e5ce60fae679d50c850"))
;;     (package
;;      (name "emacs-wordel")
;;      (version "git")
;;      (source (origin
;; 	      (method git-fetch)
;; 	      (uri (git-reference
;; 		    (url "https://github.com/progfolio/wordel")
;; 		    (commit commit)))
;; 	      (file-name (git-file-name name version))
;; 	      (sha256
;; 	       (base32
;; 		"12b42qcmc8k15n2zdvl264sz9w697f6dm9vynyw7gk3g16rydbhj"))))
;;      (build-system emacs-build-system)
;;      (home-page "https://github.com/progfolio/wordel")
;;      (synopsis "Wordle in Emacs")
;;      (description "For the uninitiated, this is a process of elimination word game. You guess a word and each letter of your word will be color coded to reveal how it relates to the hidden word.")
;;      (license license:gpl3+))))

(define-public emacs-wordel
  (package
   (name "emacs-wordel")
   (version "20220225.1907")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/progfolio/wordel.git")
           (commit "5a1f9a45c3d1fa58c3de5183c4456572ae861d49")))
     (sha256
      (base32 "0jd7lbb7mbjfk66mkzxnhffh3dlj28xma5a8km5hc4lclqlm74sx"))))
   (build-system emacs-build-system)
   (arguments
    '(#:include
      '("^[^/]+.el$"
        "^[^/]+.el.in$"
        "^dir$"
        "^[^/]+.info$"
        "^[^/]+.texi$"
        "^[^/]+.texinfo$"
        "^doc/dir$"
        "^doc/[^/]+.info$"
        "^doc/[^/]+.texi$"
        "^doc/[^/]+.texinfo$"
        "^words$")
      #:exclude
      '("^.dir-locals.el$"
        "^test.el$"
        "^tests.el$"
        "^[^/]+-test.el$"
        "^[^/]+-tests.el$")))
   (home-page "https://github.com/progfolio/wordel")
   (synopsis "An Elisp implementation of \"Wordle\" (aka \"Lingo\")")
   (description "Have fun!")
   (license #f)))

;; (define-public emacs-org-modern
;;   (let ((commit "d0f13dc88781f51368c479c83d00753b78f55d46"))
;;     (package
;;      (name "emacs-org-modern")
;;      (version "git")
;;      (source (origin
;; 	      (method git-fetch)
;; 	      (uri (git-reference
;; 		    (url "https://github.com/minad/org-modern")
;; 		    (commit commit)))
;; 	      (file-name (git-file-name name version))
;; 	      (sha256
;; 	       (base32
;; 		"15r6ipl302x2pfm60a9n34hjxi5m7g1lgpbzjacn1jfs60a17fn0"))))
;;      (build-system emacs-build-system)
;;      (home-page "https://github.com/minad/org-modern")
;;      (synopsis "This package implements a “modern” style for your Org buffers using font locking and text properties. The package styles headlines, keywords, tables and source blocks. The styling is configurable, you can enable, disable or modify the style of each syntax element individually via the org-modern customization group.")
;;      (description "This package implements a “modern” style for your Org buffers using font locking and text properties. The package styles headlines, keywords, tables and source blocks. The styling is configurable, you can enable, disable or modify the style of each syntax element individually via the org-modern customization group.")
;;      (license license:gpl3+))))

(define-public emacs-org-modern
  (package
   (name "emacs-org-modern")
   (version "0.4")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://elpa.gnu.org/packages/org-modern-"
                                version ".tar"))
            (sha256
             (base32
              "0xn2vmlz43p9b1gscijwzhaxa44dsshlw31llhffqpxlw2amm1lf"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/minad/org-modern")
   (synopsis "Modern looks for Org")
   (description
    "			   ━━━━━━━━━━━━━━━━━━ 			    MODERN ORG STYLE 			   ━━━━━━━━━━━━━━━━━━


Table of Contents ─────────────────

1.  Introduction 2.  Contributions





1 Introduction ══════════════

  This package implements a \"modern\" style for your Org buffers using   font
locking and text properties.  The package styles headlines,   keywords, tables
and source blocks.  The styling is configurable, you   can enable, disable or
modify the style of each syntax element   individually via the `org-modern'
customization group.

  <https://github.com/minad/org-modern/blob/screenshots/example.gif?raw=true>

  The screenshots shows [example.org] with `org-modern-mode' turned on   and
off.  The elegant theme featured in the screenshot is   [modus-operandi].

  This package is still early in its development, so expect bugs and   issues in
particular due to unfortunate interactions of the   `variable-pitch' and
`fixed-pitch' fonts.  You should ensure that your   fonts combine harmonically
and have approximately the same   height. `org-modern-mode' tries to adjust the
tag label display based   on the value of `line-spacing'.  This looks best if
`line-spacing' has   a value between 0.1 and 0.4 in the Org buffer.  Note that
`org-indent-mode' interferes with some of the style elements applied   by
`org-modern-mode', e.g., the block brackets in the fringe.

  Bug reports, improvement or style proposals are welcome! Maybe some   more Org
elements deserve styling or alternative stylings should be   offered?

  The tag style of `org-modern' is a poor Emacsien's ripoff from   Nicholas
Rougier's beautiful [svg-tag-mode].  In contrast to   `svg-tag-mode', this
package avoids images and uses cheap and fast   Emacs box text properties.  By
only styling the text via text   properties, the styled text, e.g., dates or
tags stay editable and are   easy to interact with.

  On the downside, this restricts our flexibility and may lead to
font-dependent issues.  We do our best, but for example there is no way   we can
get round corners.  Combining `org-modern-mode' with   `svg-tag-mode' is
possible.  You can use SVG tags and use the table and   block styling from
`org-modern'.  If you are interested in further   tweaks, Emacs comes with the
builtin `prettify-symbols-mode' which can   be used for individual styling of
custom keywords.

  Another popular alternative is [org-superstar], which has a more   restricted
feature set and mainly adjusts headlines and   lists. `org-superstar' relies on
character composition, while   `org-modern' uses text properties, which are
considered more   future-proof.

  The package is available on GNU ELPA and MELPA.  You can install the   package
with `package-install'.  Then `org-modern' can be enabled   manually in an Org
buffer by invoking `M-x org-modern-mode'.  In order   to enable `org-modern' for
all your Org buffers, add `org-modern-mode'   to the Org mode hooks.

  ┌────   │ ;; Option 1: Per buffer   │ (add-hook 'org-mode-hook
#'org-modern-mode)   │ (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
 │    │ ;; Option 2: Globally   │ (global-org-modern-mode)   └────

  Try the following more extensive setup in `emacs -Q' to reproduce the   looks
of the screenshot above.

  ┌────   │ ;; Minimal UI   │ (package-initialize)   │ (menu-bar-mode -1)   │
(tool-bar-mode -1)   │ (scroll-bar-mode -1)   │ (modus-themes-load-operandi)   │
   │ ;; Choose some fonts   │ ;; (set-face-attribute 'default nil :family
\"Iosevka\")   │ ;; (set-face-attribute 'variable-pitch nil :family \"Iosevka
Aile\")   │ ;; (set-face-attribute 'org-modern-symbol nil :family \"Iosevka\")   │
 │ ;; Add frame borders and window dividers   │ (modify-all-frames-parameters
│  '((right-divider-width .  40)   │    (internal-border-width .  40)))   │
(dolist (face '(window-divider   │ 		window-divider-first-pixel   │
		window-divider-last-pixel))   │   (face-spec-reset-face face)   │
(set-face-foreground face (face-attribute 'default :background)))   │
(set-face-background 'fringe (face-attribute 'default :background))   │    │
(setq   │  ;; Edit settings   │  org-auto-align-tags nil   │  org-tags-column 0
 │  org-catch-invisible-edits 'show-and-error   │  org-special-ctrl-a/e t   │
org-insert-heading-respect-content t   │    │  ;; Org styling, hide markup etc.
 │  org-hide-emphasis-markers t   │  org-pretty-entities t   │  org-ellipsis \"…\"
 │    │  ;; Agenda styling   │  org-agenda-tags-column 0   │
org-agenda-block-separator ?─   │  org-agenda-time-grid   │  '((daily today
require-timed)   │    (800 1000 1200 1400 1600 1800 2000)   │    \" ┄┄┄┄┄ \"
\"┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄\")   │  org-agenda-current-time-string   │  \"⭠ now
─────────────────────────────────────────────────\")   │    │
(global-org-modern-mode)   └────


[example.org] <file:example.org>

[modus-operandi] <https://protesilaos.com/emacs/modus-themes>

[svg-tag-mode] <https://github.com/rougier/svg-tag-mode>

[org-superstar] <https://github.com/integral-dw/org-superstar-mode>


2 Contributions ═══════════════

  Since this package is part of [GNU ELPA] contributions require a   copyright
assignment to the FSF.


[GNU ELPA] <http://elpa.gnu.org/packages/org-modern.html>")
   (license license:gpl3+)))

(define-public emacs-mpv
  (package
   (name "emacs-mpv")
   (version "20211228.2043")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/kljohann/mpv.el.git")
           (commit "4fd8baa508dbc1a6b42b4e40292c0dbb0f19c9b9")))
     (sha256
      (base32 "03zziy1lcvpf1wq15bsxwy0dhdb2z7rrdcj6srgrmgykz2wf33q7"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/kljohann/mpv.el")
   (synopsis "control mpv for easy note-taking")
   (description
    "This package is a potpourri of helper functions to control a mpv process via its
IPC interface.  You might want to add the following to your init file:

(org-add-link-type \"mpv\" #'mpv-play) (defun org-mpv-complete-link (&optional
arg)   (replace-regexp-in-string    \"file:\" \"mpv:\"    (org-file-complete-link
arg)    t t)) (add-hook 'org-open-at-point-functions
#'mpv-seek-to-position-at-point)")
   (license #f)))

(define-public emacs-dirvish
  (package
   (name "emacs-dirvish")
   (version "20220307.1457")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/alexluigit/dirvish.git")
	   (commit "f010dc7a081a61588c220fb815f023544f444493")))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0nbbj23ha9v03rqxxc6y030cvnyadk9258x287623gvy2s5p3bv0"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-transient))
   (arguments
    '(#:include
      '("^[^/]+.el$"
	"^[^/]+.el.in$"
	"^dir$"
	"^[^/]+.info$"
	"^[^/]+.texi$"
	"^[^/]+.texinfo$"
	"^doc/dir$"
	"^doc/[^/]+.info$"
	"^doc/[^/]+.texi$"
	"^doc/[^/]+.texinfo$"
	"^extensions/[^/]+.el$")
      #:exclude
      '("^.dir-locals.el$"
	"^test.el$"
	"^tests.el$"
	"^[^/]+-test.el$"
	"^[^/]+-tests.el$")))
   (home-page "https://github.com/alexluigit/dirvish")
   (synopsis "A modern file manager based on dired mode")
   (description
    "`dirvish' is a minimalistic file manager based on `dired-mode'.  It is inspired
by ranger (see https://github.com/ranger/ranger), which is a terminal file
manager that shows a stack of the parent directories, and updates its parent
buffers while navigating the file system with an optional preview window at side
showing the content of the selected file.

Unlike `ranger.el', which tries to become an all-around emulation of ranger,
dirvish.el is more bare-bone, meaning it does NOT try to port all \"goodness\"
from ranger, instead, it tries to:

  - provides a better Dired UI   - make some Dired commands more intuitive   -
keep all your Dired key bindings

The name `dirvish' is a tribute to `vim-dirvish'.")
   (license #f)))

(define-public emacs-empv
  (let ((commit "7fc0d18d11d9166322509aa65738b0047abce4b0"))
    (package
     (name "emacs-empv")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/isamert/empv.el")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"06rrv7ld4c7vl9gj2bab44m4y918rnw5qgl0agw60qjffg9cxmr8"))))
     (build-system emacs-build-system)
     (propagated-inputs (list emacs-consult
			      emacs-embark
			      mpv))     
     (home-page "https://github.com/isamert/empv.el")
     (synopsis "An Emacs media player, media library manager, radio player, YouTube frontend")
     (description "An Emacs media player, based on mpv. More precisely this package provides somewhat comprehensive interface to mpv with bunch of convenience functions.

empv is mostly focused on audio but it also provides some means to manage videos. It also supports YouTube searches. If you are a consult user, then you can also install consult-empv package to get search suggestions while using empv’s YouTube search capabilities.

Workflow is generally M-x empv-something and completing-read based, no buffers or complex interfaces (except for the tabulated YouTube results). Scroll down to see available interactive functions. No default keybindings are provided.")
     (license #f))))

(define-public emacs-osm
  (package
   (name "emacs-osm")
   (version "0.8")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/osm-"
           version
           ".tar"))
     (sha256
      (base32 "1vvd149n4pa6jy7xk5dmhi0nfwcjd4rvxn283f1jxp5jvv47m202"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/minad/osm")
   (synopsis "OpenStreetMap viewer")
   (description
    "\t       ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \t\tOSM.EL - OPENSTREETMAP
VIEWER FOR EMACS \t       ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


Table of Contents ─────────────────

1.  Features 2.  Configuration 3.  Bookmarks and Org links 4.  Commands and Key
Bindings 5.  Related projects 6.  Contributions


<https://github.com/minad/osm/blob/screenshots/osm.png?raw=true> (Map tiles ©
<https://opentopomap.org>, <https://openstreetmap.org>)


1 Features ══════════

  • Zoomable and moveable map display   • Display of tracks and POIs from GPX
file   • Parallel fetching of tiles with curl   • Moving in large and small
steps   • Mouse support (dragging, clicking)   • Map scale indicator   • Go to
coordinate   • Search for location by name   • Org link support   • Bookmarked
positions with pins   • Multiple preconfigured tile servers


2 Configuration ═══════════════

  The package is available on GNU ELPA and can be installed with
`package-install'.  The following is an example configuration which   relies on
`use-package'.  Please take a look at the [wiki] for   additional configuration.

  ┌────   │ (use-package osm   │   :bind ((\"C-c m h\" .  osm-home)   │ \t (\"C-c m
s\" .  osm-search)   │ \t (\"C-c m v\" .  osm-server)   │ \t (\"C-c m t\" .  osm-goto)
 │ \t (\"C-c m x\" .  osm-gpx-show)   │ \t (\"C-c m j\" .  osm-bookmark-jump))   │
:init   │   ;; Load Org link support   │   (with-eval-after-load 'org   │
(require 'osm-ol)))   └────


[wiki] <https://github.com/minad/osm/wiki>


3 Bookmarks and Org links ═════════════════════════

  To store a bookmark press the key `b', to store Org links press the   key `l'.
 You can also use a custom binding, e.g., `C-c l'.  Then the   link can be
inserted into an Org buffer with `C-c C-l'.  Bookmarks and   Org links can be
created at point with the mouse, see   `osm-bookmark-set-click' and
`osm-org-link-click'.

  Examples:

  •    •    •    •    • 


4 Commands and Key Bindings ═══════════════════════════

  Top-level commands:   • `osm-home': Open new map at home coordinates   •
`osm-search': Search and jump to location   • `osm-goto': Go to coordinates   •
`osm-server': Select server   • `osm-bookmark-jump': Jump to bookmark   •
`osm-gpx-show': Show GPX file in map viewer

  Key bindings in `osm-mode' buffer:   • `<arrow>': Small step scrolling   •
`C-<arrow>', `M-<arrow>': Large step scrolling   • `+', `SPC': `osm-zoom-in' -
Zoom in   • `-', `S-SPC': `osm-zoom-out' - Zoom out   • `<mouse-1>':
`osm-center-click' - Center to point   • `<mouse-2>': `osm-org-link-click' -
Store point as Org link   • `<mouse-3>': `osm-bookmark-set-click' - Store point
as bookmark   • `<osm-bookmark mouse-*>': `osm-bookmark-delete-click' - Click on
   bookmark at point to delete   • `<down-mouse-*>': `osm-mouse-drag' - Drag the
map with the mouse   • `d', `DEL': `osm-bookmark-delete' - Delete selected
bookmark   • `n': `osm-bookmark-rename' - Rename selected bookmark   • `t':
`osm-goto' - Go to location   • `h': `osm-home' - Go to home location   • `s':
`osm-search' - Search for location   • `v': `osm-server' - Select tile server
• `x': `osm-gpx-show' - Show tracks and POIs from GPX file   • `X':
`osm-gpx-hide' - Hide overlays from GPX file   • `l': `org-store-link' - Store
org link   • `b': `osm-bookmark-set' - Set bookmark   • `j': `osm-bookmark-jump'
- Jump to bookmark   • `q': `quit-window' - Close buffer and window   • `c':
`clone-buffer' - Clone buffer


5 Related projects ══════════════════

  There have been other attempts at map viewers in Emacs before.

  • <https://github.com/ruediger/osm-mode>   •
<https://github.com/svenssonjoel/Emacs-OSM>   •
<https://github.com/jd/google-maps.el>   •
<https://github.com/emacsattic/org-osm-link>


6 Contributions ═══════════════

  Since this package is part of [GNU ELPA] contributions require a   copyright
assignment to the FSF.


[GNU ELPA] <http://elpa.gnu.org/packages/osm.html>")
   (license license:gpl3+)))

(define-public emacs-mentor
  (package
   (name "emacs-mentor")
   (version "20220113.2136")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/skangas/mentor.git")
           (commit "afab3a14a4bfb5117f8e25417fdf151611b3df0b")))
     (sha256
      (base32 "0wcmgynshjk9xdiv4y86d5qb7ncxkswim2gp34hkhslhvfmhfh8f"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-xml-rpc rtorrent emacs-async))
   (home-page "https://github.com/skangas/mentor")
   (synopsis "Frontend for the rTorrent bittorrent client")
   (description
    "mentor is a GNU Emacs frontend for the `rTorrent' bittorrent client.

By default, it will start and run rTorrent from within Emacs but can also be
configured to use an external rTorrent instance over XML-RPC.

This project aims to provide a feature complete and highly customizable
interface, which will feel familiar to Emacs users.  Key bindings are chosen to
be as close to the vanilla rTorrent curses interface as possible.

You can find the latest development version of mentor here:

https://www.github.com/skangas/mentor

Bug reports, comments, and suggestions are welcome! Send them to Stefan Kangas
<stefankangas@gmail.com> or report them on GitHub.")
   (license #f)))

(define-public emacs-engrave-faces
  (package
   (name "emacs-engrave-faces")
   (version "0.2.0")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://elpa.gnu.org/packages/engrave-faces-"
           version
           ".tar"))
     (sha256
      (base32 "1d0hsfg3wvwbs82gjyvfjvy1sszcm7qa50bch1b6jy05kbc543ip"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/tecosaur/engrave-faces")
   (synopsis "Convert font-lock faces to other formats")
   (description
    "#+title: Engrave Faces #+author: tecosaur

There are some great packages for Exporting buffers to particular formats, but
each one seems to reinvent the core mechanism of processing the font-lock in a
buffer such that it can be exported to a particular format.

This package aims to produce a versatile generic core which can process a
fortified buffer and elegantly pass the data to any number of backends which can
deal with specific output formats.

This is very much a work in progress, a rough plan can be seen below.  I fully
expect some important items to have been forgotten.

*Font lock processing* - [X] Single faces - [X] Merge multiple faces - [ ]
Process overlays

*Included backends* - [X] LaTeX - [X] HTML - [X] ANSI")
   (license license:gpl3+)))

;; (define-public emacs-boxy
;;   (package
;;     (name "emacs-boxy")
;;     (version "1.0.4")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (string-append
;;                "https://elpa.gnu.org/packages/boxy-"
;;                version
;;                ".tar"))
;;         (sha256
;;           (base32 "0cwzjyj8yjg13b63va6pnj01m6kc5g3zx69c9w2ysl2wk24zn6dz"))))
;;     (build-system emacs-build-system)
;;     (home-page "https://gitlab.com/tygrdev/boxy.el")
;;     (synopsis "A boxy layout framework")
;;     (description
;;       "  Boxy provides an interface to create a 3D representation of   boxes.  Each box
;; has a relationship with one other box.  Multiple   boxes can be related to one
;; box.  The relationship can be any of   the following:

;;   - in   - on   - behind   - on top of   - in front of   - above   - below   -
;; to the right of   - to the left of

;;   The relationship determines the ordering and structure of the   resulting boxy
;; diagram.

;;   Only boxes which have their :name slot set will be drawn to the   buffer.
;; Boxes without names still take up space and can have   children, so can be used
;; for grouping.  All diagrams have one top   level unnamed box called a `world'.

;;   Each box should have either a list of markers or an action   function.  When
;; viewing a box that has a list of markers, the   following keybindings are
;; available:

;;   RET/mouse-1   - Jump to the first marker   o             - Open next marker in
;; other window.                      Pressed multiple times, cycle through
;; markers.    M-RET         - Open all markers as separate buffers.
;;       This will split the current window as needed.

;;   When viewing a box with an action function, RET and <mouse-1>   will be bound
;; to that function.

;;   Additionally, all boxes have the following keybindings defined:

;;   r     - Jump to the box directly related to the current box.
;; Repeated presses will eventually take you to the             top level box.
;; TAB   - Cycle visibility of box's children

;;   See the class definition for `boxy-box' for all other available   properties.

;;   To start, create an empty box named `world'.

;;     (let ((world (boxy-box)))

;;   Use the method `boxy-add-next' to add top-level boxes to the   world, without
;; relationships:

;;     (let ((cyprus (boxy-box :name \"Cyprus\"))           (greece (boxy-box :name
;; \"Greece\")))       (boxy-add-next cyprus world)       (boxy-add-next greece
;; world)

;;   To ease the boxy renderer, use the :expand-siblings and   :expand-children
;; slots.  These should be list of functions which   take the current box as an
;; argument and call `boxy-add-next' to   add sibling boxes and children boxes
;; respectively.  Children   boxes are defined as any box with a relationship of
;; in, on,   behind, in front of, or on top of.  Sibling boxes are defined as   any
;; box with a relationship of above, below, to the left of, or   to the right of.

;;      (object-add-to-list cyprus :expand-siblings
;; '(lambda (box)                             (boxy-add-next
;;       (boxy-box :name \"Lebanon\" :rel \"below\")
;; box)))

;;   The expansion slots will be called when the user toggles the   box's
;; visibility.

;;   To display a box in a popup buffer, use the function `boxy-pp'.

;;   The methods `boxy-merge' and `boxy-merge-into' should be   used to merge boxes
;; together.  `boxy-merge' takes a list of   boxes and merges them into one box.
;; `boxy-merge-into' takes   two boxes and merges the first into the second.")
;;     (license license:gpl3+)))

;; (define-public emacs-org-real
;;   (package
;;     (name "emacs-org-real")
;;     (version "1.0.4")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (string-append
;;                "https://elpa.gnu.org/packages/org-real-"
;;                version
;;                ".tar"))
;;         (sha256
;;           (base32 "0bn9vyx74lki2nggzir02mcrww94dnqpbkryjr7a4i6am0ylf705"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-boxy emacs-org))
;;     (home-page "https://gitlab.com/tygrdev/org-real")
;;     (synopsis "Keep track of real things as org-mode links")
;;     (description
;;       "\t\t\t       ━━━━━━━━━━ \t\t\t\tORG REAL \t\t\t       ━━━━━━━━━━


;; Table of Contents ─────────────────

;; 1.  Usage ..  1.  Inserting a link ..  2.  Inserting a link with completion ..
;; 3.  Rearranging things ..  4.  Opening links ..  5. `org-real-world' ..  6.
;; Boxy mode 2.  License 3.  Development ..  1.  Setup ..  2.  Commands: .....  1.
;; `eldev lint' .....  2. `eldev compile' .....  3. `eldev test' .....  4. `eldev
;; package' .....  5. `eldev md5'


;; Keep track of real things as org-mode links.

;; `package-install RET org-real RET'


;; 1 Usage ═══════

;; 1.1 Inserting a link ────────────────────

;;   To create a real link in org-mode, use `C-c C-l real RET'.

;;   Real links are created inside-out, starting with the most specific   item and
;; working to the most general.

;;   ┌────   │    │ ┌──────────────────────────────┐   │ │
;;     │   │ │           outside            │   │ │              ↑               │
;;  │ │  ┌────────── ↑ ───────────┐  │   │ │  │           ↑            │  │   │ │
;; │           ↑            │  │   │ │  │           ↑            │  │   │ │  │
;; ┌─────── ↑ ────────┐  │  │   │ │  │  │        ↑         │  │  │   │ │  │  │
;; inside      │  │  │   │ │  │  │                  │  │  │   │ │  │
;; └──────────────────┘  │  │   │ │  │                        │  │   │ │
;; └────────────────────────┘  │   │ │                              │   │
;; └──────────────────────────────┘   │    └────

;;   The first prompt will be for the thing which is trying to be linked   to,
;; called the \"primary thing\".  Then, the prompt will continue to ask   if more
;; context should be added by pressing `+' until the user   confirms the link with
;; `RET'.

;;   <file:demo/insert-link.gif>


;; 1.2 Inserting a link with completion ────────────────────────────────────

;;   Org real will help create links by parsing all existing links in the   current
;; buffer.  When choosing an existing thing, all of the context   for that thing is
;; automatically added to the current completion.

;;   This is only possible because of the unique inside-out completion   style for
;; inserting a link and makes it very easy to add new things to   an existing
;; container.

;;   <file:demo/insert-link-with-completion.gif>


;; 1.3 Rearranging things ──────────────────────

;;   In order to edit a real link, place the cursor on the link and press   `C-c
;; C-l'.  Narrow the link down beyond the context you wish to change   by pressing
;; `BACKSPACE' repeatedly, then `+' to add the new context.

;;   <file:demo/edit-link.gif>

;;   If any container in the new link does not match an existing container   in the
;; buffer, org-real will prompt you to replace all occurences of   that thing with
;; the new context and relationships.

;;   This makes it easy to keep things in sync.  If any one link changes
;; location, all links in the currnet buffer are updated accordingly.

;;   <file:demo/apply-changes.gif>

;;   If a link is changed manually, use the interactive function   `org-real-apply'
;; with the cursor on top of the new link to apply   changes from that link to the\nbuffer.


;; 1.4 Opening links ─────────────────

;;   To open a real link, place the cursor within the link and press `C-c   C-o'.
;; This will display a popup buffer in Org Real mode showing the   location of the
;; link.


;; 1.5 `org-real-world' ────────────────────

;;   To view all real links in the current buffer in a combined diagram,   use the
;; interactive function `org-real-world'

;;   Suggested keybinding:   ┌────   │ (define-key org-mode-map (kbd \"C-c r w\")
;; 'org-real-world)   └────


;; 1.6 Boxy mode ─────────────

;;   Once in boxy mode, you can cycle the visibility level of all children   with
;; `S-TAB' or use `TAB' to toggle the visibility of children for a   single box.

;;   Emacs movement keys will navigate by boxes rather than   characters.  Each box
;; in the diagram has these keybindings:

;;   • `RET / mouse-1' Jump to first occurrence of link   • `o' Cycle occurrences
;; of links in other window   • `M-RET' Open all occurences of links by splitting
;; the current window   • `r' Jump to the box directly related to the current box
;; • `TAB' expand/collapse children boxes

;;   <file:demo/boxy-mode.gif>


;; 2 License ═════════

;;   GPLv3


;; 3 Development ═════════════

;; 3.1 Setup ─────────

;;   Install [eldev]


;; [eldev] <https://github.com/doublep/eldev#installation>


;; 3.2 Commands: ─────────────

;; 3.2.1 `eldev lint' ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

;;   Lint the `org-real.el' file


;; 3.2.2 `eldev compile' ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

;;   Test whether ELC has any complaints


;; 3.2.3 `eldev test' ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

;;   Run all test files in `tests/'


;; 3.2.4 `eldev package' ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

;;   Creates a dist folder with `org-real-<version>.el'


;; 3.2.5 `eldev md5' ╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌

;;   Creates an md5 checksum against all files in the dist folder.")
;;     (license license:gpl3+)))

(define-public emacs-magit-section
  (package
   (name "emacs-magit-section")
   (version "20220329.1154")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/magit/magit.git")
           (commit "d1ad778280f651f0ab87ce191784b96b3ebe312a")))
     (sha256
      (base32 "0x09i80rrf2gji0igqvjirgdmpxfzfcaynfydbhdzrf56a6syzn5"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-dash))
   (arguments
    '(#:include
      '("^lisp/magit-section.el$"
        "^lisp/magit-section-pkg.el$"
        "^docs/magit-section.texi$"
        "^Documentation/magit-section.texi$")
      #:exclude
      '()))
   (home-page "https://github.com/magit/magit")
   (synopsis "Sections for read-only buffers")
   (description
    "This package implements the main user interface of Magit — the collapsible
sections that make up its buffers.  This package used to be distributed as part
of Magit but now it can also be used by other packages that have nothing to do
with Magit or Git.")
   (license #f)))

(define-public emacs-elfeed-summary
  (package
   (name "emacs-elfeed-summary")
   (version "20220330.1143")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/SqrtMinusOne/elfeed-summary.git")
           (commit "2f351bed59e251b53b884f8c59f828a352d56269")))
     (sha256
      (base32 "16ibv7kga87378n8j0xpb3wpjh884m5ay5nr6w3n0x54dgrds7y8"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-magit-section emacs-elfeed))
   (home-page "https://github.com/SqrtMinusOne/elfeed-summary.el")
   (synopsis "Feed summary interface for elfeed")
   (description
    "The package provides a tree-based feed summary interface for elfeed.  The tree
can include individual feeds, searches, and groups.  It mainly serves as an
easier \"jumping point\" for elfeed, so searching a subset of the elfeed database
is one action away.

`elfeed-summary' pops up the summary buffer.  The buffer shows individual feeds
and searches, combined into groups.  The structure is determined by the
`elfeed-summary-settings' variable.

Also take a look at the package README at
<https://github.com/SqrtMinusOne/elfeed-summary> for more information.")
   (license #f)))

(define-public emacs-elfeed-tube
  (package
   (name "emacs-elfeed-tube")
   (version "master")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/karthink/elfeed-tube")
           (commit "426e6b9dafd9e3ea72d987c0b169bd28828f831a")))
     (sha256
      (base32 "1mxwh9wirvl835cjf65k0zm0bsxdsqbhj6mw67v1nzkfjdhylhs9"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-aio emacs-elfeed curl emacs-mpv mpv yt-dlp))
   (home-page "https://github.com/karthink/elfeed-tube")
   (synopsis "Youtube integration for Elfeed, the feed reader for Emacs")
   (description
    "Elfeed Tube is an Emacs package for a richer, interactive, noise-free and fully text-capable interface to your Youtube subscriptions and playlists using Elfeed, the RSS feed reader for Emacs. Think of it as supercharging Elfeed, or perhaps a taste of what the RSS/Atom protocol could have become today if it had continue to evolve.")
   (license #f)))

(define-public emacs-litex-mode
  (package
   (name "emacs-litex-mode")
   (version "20220415.1704")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/Atreyagaurav/litex-mode.git")
                  (commit "5d5750af2990c050c8d36baa4b8e7a45850d5a6a")))
            (sha256
             (base32
              "0kfij90iqslc6lnlpvj0hmfhfrfhp28ljd4zj6gv8wz02aldkjgd"))))
   (build-system emacs-build-system)
   (home-page "https://github.com/Atreyagaurav/litex-mode")
   (synopsis "Minor mode for converting lisp to LaTeX")
   (description
    "converts valid mathematical Lisp expressions to LaTeX snippets improved from
https://emacs.stackexchange.com/a/70360 modified with help from
https://gist.github.com/bpanthi977/4b8ece0eeff3bc05bb82275a23cbb56d

For detailed help visit github page: https://github.com/Atreyagaurav/litex-mode")
   (license #f)))

(define-public emacs-org-menu
  (let ((commit "9cd10161c2b50dfef581f3d0441683eeeae6be59"))
    (package
     (name "emacs-org-menu")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/sheijk/org-menu")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"156ql9zy0gk54kl9gf5mh3gi9s8s2hk0q8ykj5gf52axcvnxdrgi"))))
     (build-system emacs-build-system)
     (propagated-inputs (list emacs-yasnippet))
     (home-page ".")
     (synopsis ".")
     (description ".")
     (license #f))))

(define-public emacs-denote
  (package
   (name "emacs-denote")
   (version "0.4.0")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://elpa.gnu.org/packages/denote-"
                                version ".tar"))
            (sha256
             (base32
              "031ia1k5fqzq154jhi4icvivhdg8yn7zfkwy81yf0ivcsivri54s"))))
   (build-system emacs-build-system)
   (home-page "https://git.sr.ht/~protesilaos/denote")
   (synopsis "Simple notes with an efficient file-naming scheme")
   (description
    "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━	 DENOTE: SIMPLE NOTES WITH AN EFFICIENT FILE-NAMING SCHEME
  Protesilaos Stavrou info@protesilaos.com ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
19.3 Concept index ──────────────────")
   (license license:gpl3+)))
