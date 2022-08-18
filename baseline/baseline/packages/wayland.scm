(define-module (baseline packages wayland)
  #:use-module (guix packages)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))


;; (define-public cagebreak
;;   (package
;;     (name "cagebreak")
;;     (version "1.8.0")
;;     (source (origin
;;               (method git-fetch)
;;               (uri (git-reference
;;                     (url "https://github.com/project-repo/cagebreak")
;;                     (commit version)))
;;               (file-name (git-file-name name version))
;;               (sha256
;;                (base32
;;                 "0296mnzk7qd0zvnhw716jvpp7madjsar373ixx4qcff0m0jwfrxm"))))
;;     (build-system meson-build-system)
;;     (arguments '(#:configure-flags '("-Dxwayland=true")))
;;     (native-inputs
;;      (list pandoc pkg-config))
;;     (inputs
;;      (list libevdev pango wlroots))
;;     (home-page "https://github.com/project-repo/cagebreak")
;;     (synopsis "Tiling wayland compositor inspired by ratpoison")
;;     (description
;;      "@command{cagebreak} is a slim, keyboard-controlled, tiling compositor
;; for wayland conceptually based on the X11 window manager
;; @command{ratpoison}.")
;;     (license license:expat)))

(define-public cage
  (package
   (name "cage")
   (version "0.1.4")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/Hjdskes/cage")
		  (commit (string-append "v" version))))
	    (file-name (git-file-name name (string-append "v" version)))
	    (sha256
	     (base32
	      "0vm96gxinhy48m3x9p1sfldyd03w3gk6iflb7n9kn06j1vqyswr6"))))
   (build-system meson-build-system)
   (arguments '(#:configure-flags '("--buildtype=release")))
   (native-inputs
    (list pkg-config))
   (inputs
    (list wlroots libxkbcommon))
   (home-page "https://github.com/Hjdskes/cage")
   (synopsis "A Wayland kiosk")
   (description "This is Cage, a Wayland kiosk. A kiosk runs a single, maximized application.")
   (license license:expat)))
