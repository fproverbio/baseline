(define-module (baseline packages ytfzf)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (guix git-download)
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages image-viewers)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ytfzf-2.0
  (let ((commit "b685438949c105e13499fcd24e69e24c346b7ee3")
	(revision "1"))
    (package
     (inherit ytfzf)
     (name "ytfzf-2.0")
     (version "2.0")
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
	     (url "https://github.com/pystardust/ytfzf")
	     (commit commit)))
       (file-name (git-file-name name version))
       (sha256
	(base32
	 "0xrck7hgj7nw3gsdngy3vjrqqkmakig32vnsp02lm1gyn7fhxx55"))))
     (build-system gnu-build-system)
     (arguments
      `(#:phases
	(modify-phases %standard-phases
	 (replace 'install
		  (lambda* (#:key outputs #:allow-other-keys)
		    (let ((bin (string-append (assoc-ref outputs "out")
					      "/bin")))
		      (install-file "ytfzf" bin)
		      #t))))))
     (home-page "https://github.com/pystardust/ytfzf/")
     (synopsis "https://github.com/pystardust/ytfzf/")
     (description "placeholder")
     (license license:gpl3+))))

;; (define-public ytfzf-2.0
;;   (package
;;    (inherit ytfzf)
;;    (name "ytfzf-2.0")
;;    (version "2.0")
;;    (source
;;     (origin
;;      (method git-fetch)
;;      (uri (git-reference
;; 	   (url "https://github.com/pystardust/ytfzf")
;; 	   (commit (string-append "v" version))))
;;      (file-name (git-file-name name version))
;;      (sha256
;;       (base32
;;        "0gw1k2jhqpl0cirapqdgm4c2vpyligxmrzm015pn3kz85ladzqi6"))))
;;    (home-page "aa")
;;    (synopsis "aa")
;;    (description "aa")
;;    (license license:gpl3+)))
