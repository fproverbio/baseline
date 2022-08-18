(define-module (baseline packages lisp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system r)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lisp)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages web-browsers)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nyxt-master
  (let ((commit "cd632f0e2d1cb60a3150f2ba7bee6607a9abda83"))
    (package
     (inherit nyxt)
     (name "nyxt-master")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/atlas-engineer/nyxt")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"06isg4phdz83i6n2xr7vn9har78vqjc4142gfqclwqyfgyq2gl6j"))))
     (native-inputs
      (list cl-gopher
	    cl-tld
	    cl-nfiles
	    cl-nhooks
	    cl-phos
	    cl-nkeymaps
	    cl-slynk
	    cl-dissect
	    cl-py-configparser
	    sbcl)))))
