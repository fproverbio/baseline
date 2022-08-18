(define-module (baseline packages video)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (guix git-download)
  #:use-module (guix build utils)
  #:use-module (guix build-system waf)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages video)
  #:use-module (gnu packages check)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages xdisorg)
  #:use-module ((guix licenses) #:prefix license:))

(define-public mpv-git
  (let ((commit "2606d4cc516a7183c0c00aa44d1e6b211fc85041"))
    (package
     (inherit mpv)
     (name "mpv-git")
     (version "2606d4c")
     (source (origin
 	      (method git-fetch)
 	      (uri (git-reference
 		    (url "https://github.com/mpv-player/mpv")
 		    (commit commit)))
 	      (file-name (git-file-name name version))
 	      (sha256
 	       (base32
 		"18nhjsnq95wkrdrl9991p61lk113pi97a6fypcrk8ih0zdmzm5vi"))))
     (propagated-inputs (list libplacebo)))))

(define-public libplacebo-git
  ;; broken for the time being by virtue of libplacebo being broken
  ;; the current error is due to python3-mako not being present.
  (let ((commit "abe18708a49929300dd83f54857392264699630d"))
    (package
     (inherit libplacebo)
     (name "libplacebo-git")
     (version "master")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://code.videolan.org/videolan/libplacebo")
		    (commit commit)
		    (recursive? #t)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32 "0mds3ig0v321v0j5b366b24nkiw1q1pd8dx8azccj1w7ml1q10i0")))))))

;; broken, no /bin
(define-public myuzi
  (let ((commit "18c1d48fa7622decf28da217896a9e90cd7f4cef"))
    (package
     (name "myuzi")
     (version "master")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab.com/zehkira/myuzi")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32 "1kjzvxdr2wayjnkkyfg99jzrxwn4asdqqkmbwc7a82ckmcbqj295"))))
     (build-system python-build-system)
     (arguments
      (list
       #:tests? #f
       #:phases
       #~(modify-phases %standard-phases
			(delete 'configure))))
     (home-page "https://gitlab.com/zehkira/myuzi")
     (propagated-inputs (list python-beautifulsoup4 python-setuptools python-pygobject
			      python-requests gst-libav gst-plugins-good yt-dlp xclip))
     (synopsis ".")
     (description ".")
     (license #f))))

(define-public python-mako-git
  (let ((commit "7c5b28ac47755598e8c5bdfc995eaf220132e672"))
    (package
     (inherit python-mako)
     (name "python-mako-git")
     (version "master")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/sqlalchemy/mako")
		    (commit commit)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"0yb29svfcnfdiraxsnp60yz373snbb12ja5xb2fkldym8k1w6x4b"))))
     (build-system python-build-system)
     (native-inputs (list python-pytest))
     (arguments
      `(#:phases (modify-phases %standard-phases
				(replace 'check
					 (lambda* (#:key tests? #:allow-other-keys)
					   (if tests?
					       (invoke "nosetests" "-v")
					       (format #t "test suite not run~%"))
					   #t))))))))
