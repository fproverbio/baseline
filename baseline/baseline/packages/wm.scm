(define-module (baseline packages wm)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system meson)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

;; (define-public spice-protocol
;;   (package
;;    (name "spice-protocol")
;;    (version "0.14.3")
;;    (source (origin
;;             (method url-fetch)
;;             (uri (string-append
;;                   "https://www.spice-space.org/download/releases/"
;;                   "spice-protocol-" version ".tar.xz"))
;;             (sha256
;;              (base32
;;               "0yj8k7gcirrsf21w0q6146n5g4nzn2pqky4p90n5760m5ayfb1pr"))))
;;    (build-system meson-build-system)
;;    (arguments
;;     `(#:phases
;;       (modify-phases %standard-phases
;; 		     (add-after 'unpack 'install-documentation
;; 				(lambda* (#:key outputs #:allow-other-keys)
;; 				  (let* ((out (assoc-ref outputs "out"))
;; 					 (doc (string-append out "/share/doc/"
;; 							     ,name "-" ,version)))
;; 				    (install-file "COPYING" doc)
;; 				    #t))))))
;;    (synopsis "Protocol headers for the SPICE protocol")
;;    (description "SPICE (the Simple Protocol for Independent Computing
;; Environments) is a remote-display system built for virtual environments
;; which allows users to view a desktop computing environment.")
;;    (home-page "https://www.spice-space.org")
;;    (license (list license:bsd-3 license:lgpl2.1+))))

(define-public cardboard
  (let ((commit "b54758d85164fb19468f5ca52588ebea576cd027"))
    (package
     (name "cardboard")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab.com/cardboardwm/cardboard")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"135gp4y21fyvj749b2v9ia9akrxjwy9jk6vxkvzpxjc30k4lszia"))))
     (build-system meson-build-system)
     (native-inputs
      (list pkg-config
	    ninja
	    `("expected"
	      ,(let ((commit "0ee13cb2b058809aa9708c45ca18d494e72a759e"))
		 (origin
		  (method git-fetch)
		  (uri (git-reference
			(url "https://gitlab.com/cardboardwm/expected")
			(commit commit)))
		  (sha256
		   (base32 "1n2ig2k3c0q20gbpgy54f2qy33pa0mxls02q87xla0hpbc3s8wy4"))
		  (file-name "expected"))))))
     (propagated-inputs
      (list wayland-protocols wayland))
     (home-page "https://gitlab.com/cardboardwm/cardboard")
     (synopsis "Cardboard is a unique, scrollable tiling Wayland compositor designed with
laptops in mind. Based on wlroots.")
     (description "The idea of scrollable tiling comes from
PaperWM. Instead of tiling by filling the
screen with windows placed in a tree-like container structure, in scrollable
tiling, each workspace is a series of vertically-maximized windows placed one
after another, overflowing the screen. The monitor becomes a sliding window over
this sequence of windows, allowing for easier window placement. The main idea
is that you are not going to look at more than about three windows at the same
time. While in other tiling compositors you can put the lesser-used windows in
different workspaces, you will have to remember their position in your head and
deal with juggling through the workspaces. With scrollable tiling, unused
windows are just placed off-screen, and you can always scroll back to see them.
Cardboard also provides workspaces, each with its own distinct scrollable plane.
Each output has its own active workspace.")
     (license #f))))

