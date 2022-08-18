(define-module (baseline packages chia-blockchain)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system gnu) 
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:))

(define-public chia-blockchain
  (package
   (name "chia-blockchain")
   (version "1.2.11")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "chia-blockchain" version))
     (sha256
      (base32 "1ls85apc91130v3xawzlfpr15r1bsn8lmz9pmvanc7f4yll5y8r9"))))
   (build-system python-build-system)
   (propagated-inputs
    (list python-aiohttp
	  python-aiosqlite
	  python-bitstring
	  python-blspy
	  python-chiabip158
	  python-chiapos
	  python-chiavdf
	  python-click
	  python-clvm
	  rust-clvm-rs-0.1
	  clvm_tools
	  python-colorama
	  python-colorlog
	  python-concurrent-log-handler
	  python-cryptography
	  python-dnspythonchia
	  python-fasteners
	  python-keyring
	  python-keyrings.cryptfile
	  python-multidict
	  python-pyyaml
	  python-setproctitle
	  python-sortedcontainers
	  python-watchdog
	  python-websockets))
   (native-inputs
    (list python-aiohttp-cors
	  python-black
	  python-flake8
	  python-ipython
	  python-mypy
	  python-pytest
	  python-pytest-asyncio
	  python-types-setuptools))
   (home-page "https://chia.net/")
   (synopsis "Chia blockchain full node, farmer, timelord, and wallet.")
   (description "Chia blockchain full node, farmer, timelord, and wallet.")
   (license license:asl2.0)))

(define-public python-blspy
  (package
   (name "python-blspy")
   (version "1.0.8")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "blspy" version))
     (sha256
      (base32 "1jhybvhkyvpw6hi43qqnsig59lmqkzx6amqiwkn48ycn0npy58n8"))))
   (build-system python-build-system)
   (native-inputs (list cmake git))
   (propagated-inputs (list python-wheel libsodium-cmake))
   (home-page "https://github.com/Chia-Network/bls-signatures")
   (synopsis "BLS signatures in c++ (python bindings)")
   (description "BLS signatures in c++ (python bindings)")
   (license license:asl2.0)))

(define-public python-chiabip158
  (package
   (name "python-chiabip158")
   (version "1.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "chiabip158" version))
     (sha256
      (base32 "0pv11xhlaiafnx5vydl3q1jbhwp4pdl5lgv684qgpf7lgpi80vkl"))))
   (build-system python-build-system)
   (propagated-inputs (list pybind11))
   (home-page "https://github.com/Chia-Network/chiabip158")
   (synopsis "Chia BIP158 (wraps C++)")
   (description "Chia BIP158 (wraps C++)")
   (license #f)))

(define-public python-chiapos
  (package
   (name "python-chiapos")
   (version "1.0.7")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "chiapos" version))
     (sha256
      (base32 "0gvmi95hbam7pnmn87p3wipjbj95slqcd8yk7vc3wa8dfc0cw40y"))))
   (build-system python-build-system)
   (arguments
    '(#:phases (modify-phases %standard-phases
			      (add-before 'build
					  (lambda* )))))
   (native-inputs (list cmake pybind11 git))
   (home-page "https://github.com/Chia-Network/chiapos")
   (synopsis "Chia proof of space plotting, proving, and verifying (wraps C++)")
   (description
    "Chia proof of space plotting, proving, and verifying (wraps C++)")
   (license #f)))

(define-public python-chiavdf
  (package
   (name "python-chiavdf")
   (version "1.0.3")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "chiavdf" version))
     (sha256
      (base32 "1whlcf0iahqpdz48pfr5lbka9ga1gx5vgmnmhgcjslv7jbnqmfax"))))
   (build-system python-build-system)
   (home-page "https://github.com/Chia-Network/chiavdf")
   (synopsis "Chia vdf verification (wraps C++)")
   (description "Chia vdf verification (wraps C++)")
   (license #f)))

(define-public python-clvm
  (package
   (name "python-clvm")
   (version "0.9.7")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/Chia-Network/clvm")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "1fjr4w50dcrmf3imq3ws2s9h7xvz12zl50gyblwr0c68wasqagym"))))
   (build-system python-build-system)
   (home-page "https://github.com/Chia-Network/clvm")
   (synopsis "[Contract Language|Chia Lisp] Virtual Machine")
   (description "This is the in-development version of a LISP-like language for encumbering and releasing funds with smart-contract capabilities.")
   (license license:asl2.0)))

(define-public rust-clvm-rs-0.1
  (package
    (name "rust-clvm-rs")
    (version "0.1.16")
    (source
      (origin
	(method url-fetch)
	(uri (crate-uri "clvm_rs" version))
	(file-name (string-append name "-" version ".tar.gz"))
	(sha256
	  (base32 "0phxnv2skp10hdhy4pcng9whf2fmd8k8v5h1g70671pgqibarxk7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
	(("rust-bls12-381" ,rust-bls12-381-0.6)
	 ("rust-hex" ,rust-hex-0.4)
	 ("rust-lazy-static" ,rust-lazy-static-1)
	 ("rust-num-bigint" ,rust-num-bigint-0.4)
	 ("rust-num-integer" ,rust-num-integer-0.1)
	 ("rust-num-traits" ,rust-num-traits-0.2)
	 ("rust-openssl" ,rust-openssl-0.10)
	 ("rust-pyo3" ,rust-pyo3-0.14)
	 ("rust-sha2" ,rust-sha2-0.9)
	 ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
	 ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://github.com/Chia-Network/clvm_rs/")
    (synopsis "Implementation of `clvm` for Chia Network's cryptocurrency")
    (description "Implementation of `clvm` for Chia Network's cryptocurrency")
    (license license:asl2.0)))


(define-public clvm_tools
  (package
   (name "clvm_tools")
   (version "0.4.3")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/Chia-Network/clvm_tools")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "122pvj7q7b9sk1mpa8hvsb1ga87vh2rziahkj7zqd4ns59hgfv3d"))))
   (build-system python-build-system)
   (native-inputs
    (list python-pytest
	  python-setuptools-scm))
   (propagated-inputs
    (list python-clvm))
   (arguments '(#:tests? #f))
   (home-page "https://github.com/Chia-Network/clvm_tools")
   (synopsis "Tools for clvm development")
   (description "Tools for clvm development")
   (license license:asl2.0)))

(define-public rust-bls12-381-0.6
  (package
    (name "rust-bls12-381")
    (version "0.6.0")
    (source
      (origin
	(method url-fetch)
	(uri (crate-uri "bls12_381" version))
	(file-name (string-append name "-" version ".tar.gz"))
	(sha256
	  (base32 "0jy7wzj018w419v2605aw05v0ww4r5vk6sbjghf9z56pvvpdla3d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
	(("rust-digest" ,rust-digest-0.9)
	 ("rust-ff" ,rust-ff-0.11)
	 ("rust-group" ,rust-group-0.11)
	 ("rust-pairing" ,rust-pairing-0.21)
	 ("rust-rand-core" ,rust-rand-core-0.6)
	 ("rust-subtle" ,rust-subtle-2)
	 ("rust-zeroize" ,rust-zeroize-1))
	#:cargo-development-inputs
	(("rust-criterion" ,rust-criterion-0.3)
	 ("rust-hex" ,rust-hex-0.4)
	 ("rust-rand-xorshift" ,rust-rand-xorshift-0.3)
	 ("rust-sha2" ,rust-sha2-0.9)
	 ("rust-sha3" ,rust-sha3-0.9))))
    (home-page "https://github.com/zkcrypto/bls12_381")
    (synopsis
      "Implementation of the BLS12-381 pairing-friendly elliptic curve construction")
    (description
      "Implementation of the BLS12-381 pairing-friendly elliptic curve construction")
    (license (list license:expat license:asl2.0))))

(define-public python-concurrent-log-handler
  (package
   (name "python-concurrent-log-handler")
   (version "0.9.19")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "concurrent-log-handler" version))
     (sha256
      (base32 "02fl6zf6h85b6maizxkgxj19523xnp6j976f4lf1551zxnmpjbxi"))))
   (build-system python-build-system)
   (home-page "https://github.com/Preston-Landers/concurrent-log-handler")
   (synopsis
    "RotatingFileHandler replacement with concurrency, gzip and Windows support")
   (description
    "RotatingFileHandler replacement with concurrency, gzip and Windows support")
   (license license:asl2.0)))

(define-public python-dnspythonchia
  (package
   (name "python-dnspythonchia")
   (version "2.2.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "dnspythonchia" version))
     (sha256
      (base32 "16bxkylr31kkb2s3drl1v3py40kvdiy21q251mv79pwrldi8z1l9"))))
   (build-system python-build-system)
   (home-page "")
   (synopsis "DNS toolkit")
   (description "DNS toolkit")
   (license license:asl2.0)))

(define-public python-keyrings.cryptfile
  (package
   (name "python-keyrings.cryptfile")
   (version "1.3.8")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "keyrings.cryptfile" version))
     (sha256
      (base32 "14dgdy98rhkf23z4jz1gxdras5s06fpz9ydrgn59fylicjr9srgd"))))
   (build-system python-build-system)
   (propagated-inputs
    (list python-argon2-cffi python-keyring python-pycryptodome))
   (home-page "https://github.com/frispete/keyrings.cryptfile")
   (synopsis "Encrypted file keyring backend")
   (description "Encrypted file keyring backend")
   (license license:expat)))

(define-public python-aiohttp-cors
  (package
   (name "python-aiohttp-cors")
   (version "0.7.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "aiohttp_cors" version))
     (sha256
      (base32 "0pczn54bqd32v8zhfbjfybiza6xh1szwxy6as577dn8g23bwcfad"))))
   (build-system python-build-system)
   (native-inputs            
    (list python-pytest
	  python-setuptools-scm))    
   (arguments '(#:tests? #f))
   (propagated-inputs (list python-aiohttp))
   (home-page "https://github.com/aio-libs/aiohttp-cors")
   (synopsis "CORS support for aiohttp")
   (description "CORS support for aiohttp")
   (license license:asl2.0)))

(define-public python-types-setuptools
  (package
   (name "python-types-setuptools")
   (version "57.4.5")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "types-setuptools" version))
     (sha256
      (base32 "00kfgpsnzz3a5f8pw03x3bkawqvdjvcky24wml2358v8rbyhwq54"))))
   (build-system python-build-system)
   (home-page "https://github.com/python/typeshed")
   (synopsis "Typing stubs for setuptools")
   (description "Typing stubs for setuptools")
   (license #f)))

(define-public rust-wasm-bindgen-test-macro-0.3
  (package
    (name "rust-wasm-bindgen-test-macro")
    (version "0.3.25")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-test-macro" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "155imfqaf8jlwfcyyxxv7d0c3zysa3wvx0a3lgrr4ns3z1f82n9q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis "Internal testing macro for wasm-bindgen")
    (description "Internal testing macro for wasm-bindgen")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-test-0.3
  (package
    (name "rust-wasm-bindgen-test")
    (version "0.3.25")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-test" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1xb2z81wdywds0931jzinqha70m7cp7vzdwqyhijfaal71n3ny6f"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-console-error-panic-hook" ,rust-console-error-panic-hook-0.1)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-scoped-tls" ,rust-scoped-tls-1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-wasm-bindgen-futures" ,rust-wasm-bindgen-futures-0.4)
         ("rust-wasm-bindgen-test-macro" ,rust-wasm-bindgen-test-macro-0.3))))
    (home-page "https://github.com/rustwasm/wasm-bindgen")
    (synopsis "Internal testing crate for wasm-bindgen")
    (description "Internal testing crate for wasm-bindgen")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.75")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-shared" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1hmwidww6s80kgr3k9jr389s8jzsg8frdpjfbza655ih79s4l31f"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.
")
    (description
      "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.75")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-backend" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17s75vhjlxd4zi9c7rnw64z3ckyb2cnpw9kbbfn3mlk33als62jq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bumpalo" ,rust-bumpalo-3)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-log" ,rust-log-0.4)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1)
         ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis "Backend code generation of the wasm-bindgen tool
")
    (description "Backend code generation of the wasm-bindgen tool")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.75")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-macro-support" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "17sqziz87sikg4a0w8mxrr440fm132pcc9cwclmal0rz77fmf9kc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1)
         ("rust-wasm-bindgen-backend" ,rust-wasm-bindgen-backend-0.2)
         ("rust-wasm-bindgen-shared" ,rust-wasm-bindgen-shared-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate
")
    (description
      "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in
the shared backend crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.75")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-macro" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "177hwmvq49ib3y8dhhnsvf4klsxdcvkz4cfbvw88hig1v47by7hp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-quote" ,rust-quote-1)
         ("rust-wasm-bindgen-macro-support"
          ,rust-wasm-bindgen-macro-support-0.2))))
    (home-page "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Definition of the `#[wasm_bindgen]` attribute, an internal dependency
")
    (description
      "Definition of the `#[wasm_bindgen]` attribute, an internal dependency")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.75")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "11i5v9zr4bpvlmpm30rxmz5d832zmg68xl9f1rlfi3qryk4fq25n"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-serde" ,rust-serde-1)
         ("rust-serde-json" ,rust-serde-json-1)
         ("rust-wasm-bindgen-macro" ,rust-wasm-bindgen-macro-0.2))))
    (home-page "https://rustwasm.github.io/")
    (synopsis "Easy support for interacting between JS and Rust.
")
    (description "Easy support for interacting between JS and Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-pyo3-macros-backend-0.14
  (package
    (name "rust-pyo3-macros-backend")
    (version "0.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pyo3-macros-backend" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0wmrarmajmw8gnv8arfrn4qa00fxn1k2frhwjcz8576v6sx5j762"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-pyo3-build-config" ,rust-pyo3-build-config-0.14)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Code generation for PyO3 package")
    (description "Code generation for PyO3 package")
    (license license:asl2.0)))

(define-public rust-pyo3-macros-0.14
  (package
    (name "rust-pyo3-macros")
    (version "0.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pyo3-macros" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "16mjcmk0n8zj3v9gj4d31kxcdslkx8l6rnabh1w2r47xrimv6cfd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pyo3-macros-backend" ,rust-pyo3-macros-backend-0.14)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Proc macros for PyO3 package")
    (description "Proc macros for PyO3 package")
    (license license:asl2.0)))

(define-public rust-pyo3-build-config-0.14
  (package
    (name "rust-pyo3-build-config")
    (version "0.14.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pyo3-build-config" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "13vkcl49b2x81azb613ss256k8pazrfc4fy4ny8pzgdciirn2afi"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-once-cell" ,rust-once-cell-1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Build configuration for the PyO3 ecosystem")
    (description "Build configuration for the PyO3 ecosystem")
    (license license:asl2.0)))

(define-public rust-inventory-impl-0.1
  (package
    (name "rust-inventory-impl")
    (version "0.1.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "inventory-impl" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0j45a7nq4vircnz5m23db34527icxqnvh2si96zc9w662lvvahby"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/inventory")
    (synopsis "Implementation of macros for the `inventory` crate")
    (description "Implementation of macros for the `inventory` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-ghost-0.1
  (package
    (name "rust-ghost")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ghost" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0yalg3g1g3cz63n3phy7cdhh7p2qd220mrpxy96alwxbpqdwynqs"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/dtolnay/ghost")
    (synopsis "Define your own PhantomData")
    (description "Define your own PhantomData")
    (license (list license:expat license:asl2.0))))

(define-public rust-inventory-0.1
  (package
    (name "rust-inventory")
    (version "0.1.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "inventory" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1m1zdjgs3nzfdxf86mc1i0id56fvk8rfw63rf04yi88bqrh53szh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-ctor" ,rust-ctor-0.1)
         ("rust-ghost" ,rust-ghost-0.1)
         ("rust-inventory-impl" ,rust-inventory-impl-0.1))))
    (home-page "https://github.com/dtolnay/inventory")
    (synopsis "Typed distributed plugin registration")
    (description "Typed distributed plugin registration")
    (license (list license:expat license:asl2.0))))

(define-public rust-indoc-impl-0.3
  (package
    (name "rust-indoc-impl")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "indoc-impl" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1w58yg249kmzsn75kcj34qaxqh839l1hsaj3bzggy3q03wb6s16f"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1)
         ("rust-unindent" ,rust-unindent-0.1))))
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis "Indented document literals")
    (description "Indented document literals")
    (license (list license:expat license:asl2.0))))

(define-public rust-indoc-0.3
  (package
    (name "rust-indoc")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "indoc" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1n2fd2wm1h005hd7pjgx4gv5ymyq4sxqn8z0ssw6xchgqs5ilx27"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-indoc-impl" ,rust-indoc-impl-0.3)
         ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/dtolnay/indoc")
    (synopsis "Indented document literals")
    (description "Indented document literals")
    (license (list license:expat license:asl2.0))))

(define-public rust-pyo3-0.14
  (package
    (name "rust-pyo3")
    (version "0.14.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pyo3" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "15nximp8zr1d5y5qqjvqd0rqwkk481xab89ggbrckvk5p9i5f85g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-hashbrown" ,rust-hashbrown-0.11)
         ("rust-indexmap" ,rust-indexmap-1)
         ("rust-indoc" ,rust-indoc-0.3)
         ("rust-inventory" ,rust-inventory-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-num-bigint" ,rust-num-bigint-0.4)
         ("rust-num-complex" ,rust-num-complex-0.4)
         ("rust-parking-lot" ,rust-parking-lot-0.11)
         ("rust-paste" ,rust-paste-0.1)
         ("rust-pyo3-build-config" ,rust-pyo3-build-config-0.14)
         ("rust-pyo3-macros" ,rust-pyo3-macros-0.14)
         ("rust-serde" ,rust-serde-1)
         ("rust-unindent" ,rust-unindent-0.1))))
    (home-page "https://github.com/pyo3/pyo3")
    (synopsis "Bindings to Python interpreter")
    (description "Bindings to Python interpreter")
    (license license:asl2.0)))

(define-public rust-openssl-src-111
  (package
    (name "rust-openssl-src")
    (version "111.17.0+1.1.1m")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openssl-src" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1x7wcrk56073ik51jh9k60gn2dkkrlfakqk6iwci826imcva7mh5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/alexcrichton/openssl-src-rs")
    (synopsis "Source of OpenSSL and logic to build it.
")
    (description "Source of OpenSSL and logic to build it.")
    (license (list license:expat license:asl2.0))))

(define-public rust-openssl-sys-0.9
  (package
    (name "rust-openssl-sys")
    (version "0.9.72")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openssl-sys" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1jq3qbcvf16qn71yasdzw54b14n8nz98vr52l1gp60in72f10iky"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-autocfg" ,rust-autocfg-1)
         ("rust-cc" ,rust-cc-1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-openssl-src" ,rust-openssl-src-111)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-vcpkg" ,rust-vcpkg-0.2))))
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis "FFI bindings to OpenSSL")
    (description "FFI bindings to OpenSSL")
    (license license:expat)))

(define-public rust-openssl-0.10
  (package
    (name "rust-openssl")
    (version "0.10.38")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "openssl" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "15baqlphisr1f7ddq11jnrrzz4shdh35kwal24adyc2c4cif4yhc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitflags" ,rust-bitflags-1)
         ("rust-cfg-if" ,rust-cfg-if-1)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-once-cell" ,rust-once-cell-1)
         ("rust-openssl-sys" ,rust-openssl-sys-0.9))))
    (home-page "https://github.com/sfackler/rust-openssl")
    (synopsis "OpenSSL bindings")
    (description "OpenSSL bindings")
    (license license:asl2.0)))

(define-public rust-num-bigint-0.4
  (package
    (name "rust-num-bigint")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-bigint" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "04k5xh7d0nxay4yfb02rj841y9g5jh45d320avi53ak221y083af"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-arbitrary" ,rust-arbitrary-1)
         ("rust-autocfg" ,rust-autocfg-1)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-quickcheck" ,rust-quickcheck-1)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/rust-num/num-bigint")
    (synopsis "Big integer implementation for Rust")
    (description "Big integer implementation for Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-pairing-0.20
  (package
    (name "rust-pairing")
    (version "0.20.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pairing" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1wxpdnf1zg04j2i1ndygnlaa2zmwvg4q00zyjs0nx5n9cf9d1sbx"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t #:cargo-inputs (("rust-group" ,rust-group-0.10))))
    (home-page "https://github.com/zkcrypto/pairing")
    (synopsis "Pairing-friendly elliptic curve library")
    (description "Pairing-friendly elliptic curve library")
    (license (list license:expat license:asl2.0))))

(define-public rust-group-0.10
  (package
    (name "rust-group")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "group" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "04krmzgaq30pkld5fc1izswp6868nc26l4j70zc57wdq059kldhw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-byteorder" ,rust-byteorder-1)
         ("rust-ff" ,rust-ff-0.10)
         ("rust-rand" ,rust-rand-0.8)
         ("rust-rand-core" ,rust-rand-core-0.6)
         ("rust-rand-xorshift" ,rust-rand-xorshift-0.3)
         ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/zkcrypto/group")
    (synopsis "Elliptic curve group traits and utilities")
    (description "Elliptic curve group traits and utilities")
    (license (list license:expat license:asl2.0))))

(define-public rust-addchain-0.2
  (package
    (name "rust-addchain")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "addchain" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0w45hpybsx9gzhlxf6x9451kycg8xwj3x8qzjnk8wqm55926jbiv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-bigint" ,rust-num-bigint-0.3)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page "https://github.com/str4d/addchain")
    (synopsis "Generate addition chains")
    (description "Generate addition chains")
    (license (list license:expat license:asl2.0))))

(define-public rust-ff-derive-0.10
  (package
    (name "rust-ff-derive")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ff_derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "168ka3gwm6zz75jqkzxfdjrvxfp4iq1wbfq7sjfjdgakcv1h2yg0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-addchain" ,rust-addchain-0.2)
         ("rust-num-bigint" ,rust-num-bigint-0.3)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/zkcrypto/ff")
    (synopsis
      "Procedural macro library used to build custom prime field implementations")
    (description
      "Procedural macro library used to build custom prime field implementations")
    (license (list license:expat license:asl2.0))))

(define-public rust-wyz-0.4
  (package
    (name "rust-wyz")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wyz" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "126irvwn63kxgqjk5ap1pw3p3grw2sskyg32h0v4bqawsrx057hj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-once-cell" ,rust-once-cell-1)
         ("rust-tap" ,rust-tap-1)
         ("rust-typemap" ,rust-typemap-0.3))))
    (home-page "https://myrrlyn.net/crates/wyz")
    (synopsis "myrrlynâ\x80\x99s utility collection")
    (description "myrrlynâ\x80\x99s utility collection")
    (license license:expat)))

(define-public rust-radium-0.6
  (package
    (name "rust-radium")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "radium" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1ys4bpp2l701ghdniz90zhkvb5ykmfw2pj0m8pfcbi7bm10qygv4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/bitvecto-rs/radium")
    (synopsis "Portable interfaces for maybe-atomic types")
    (description "Portable interfaces for maybe-atomic types")
    (license license:expat)))

(define-public rust-funty-1
  (package
    (name "rust-funty")
    (version "1.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "funty" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "07lb1f8yih3g694id3n90anlgxf8m6p98bllsnn6dmb5rfwsniqq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/myrrlyn/funty")
    (synopsis "Trait generalization over the primitive types")
    (description "Trait generalization over the primitive types")
    (license license:expat)))

(define-public rust-bitvec-0.22
  (package
    (name "rust-bitvec")
    (version "0.22.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bitvec" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "09xm84dg04y8k3cm7aa81n2xfvcnidahx0qpqc60l4w6ih5g0dsj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-funty" ,rust-funty-1)
         ("rust-radium" ,rust-radium-0.6)
         ("rust-serde" ,rust-serde-1)
         ("rust-tap" ,rust-tap-1)
         ("rust-wyz" ,rust-wyz-0.4))))
    (home-page "https://bitvecto-rs.github.io/bitvec")
    (synopsis "Addresses memory by bits, for packed collections and bitfields")
    (description
      "Addresses memory by bits, for packed collections and bitfields")
    (license license:expat)))

(define-public rust-ff-0.10
  (package
    (name "rust-ff")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ff" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0kraavkyrjxgkqpfxv520bi1v7cybyp5jrazg8hj5hwbrlnhpx6h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitvec" ,rust-bitvec-0.22)
         ("rust-byteorder" ,rust-byteorder-1)
         ("rust-ff-derive" ,rust-ff-derive-0.10)
         ("rust-rand-core" ,rust-rand-core-0.6)
         ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/zkcrypto/ff")
    (synopsis "Library for building and interfacing with finite fields")
    (description "Library for building and interfacing with finite fields")
    (license (list license:expat license:asl2.0))))

(define-public rust-bls12-381-0.5
  (package
    (name "rust-bls12-381")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bls12_381" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "15r378ijkjpf075hia3b129768kl58w3wc7cnmqbwscsn247hxal"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-digest" ,rust-digest-0.9)
         ("rust-ff" ,rust-ff-0.10)
         ("rust-group" ,rust-group-0.10)
         ("rust-pairing" ,rust-pairing-0.20)
         ("rust-rand-core" ,rust-rand-core-0.6)
         ("rust-subtle" ,rust-subtle-2))))
    (home-page "https://github.com/zkcrypto/bls12_381")
    (synopsis
      "Implementation of the BLS12-381 pairing-friendly elliptic curve construction")
    (description
      "Implementation of the BLS12-381 pairing-friendly elliptic curve construction")
    (license (list license:expat license:asl2.0))))

(define-public rust-clvm-rs-0.1
  (package
    (name "rust-clvm-rs")
    (version "0.1.16")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clvm-rs" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "0phxnv2skp10hdhy4pcng9whf2fmd8k8v5h1g70671pgqibarxk7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-bls12-381" ,rust-bls12-381-0.5)
         ("rust-hex" ,rust-hex-0.4)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-num-bigint" ,rust-num-bigint-0.4)
         ("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-openssl" ,rust-openssl-0.10)
         ("rust-pyo3" ,rust-pyo3-0.14)
         ("rust-sha2" ,rust-sha2-0.9)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-wasm-bindgen-test" ,rust-wasm-bindgen-test-0.3))))
    (home-page "https://github.com/Chia-Network/clvm_rs/")
    (synopsis "Implementation of `clvm` for Chia Network's cryptocurrency")
    (description "Implementation of `clvm` for Chia Network's cryptocurrency")
    (license license:asl2.0)))

(define-public libsodium-cmake
  (let ((commit "f73a3fe1afdc4e37ac5fe0ddd401bf521f6bba65"))
    (package
     (name "libsodium-cmake")
     (version "git")
     (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/AmineKhaldi/libsodium-cmake")
		    (commit commit)))
	      (file-name (git-file-name name (string-append "git+" commit)))
	      (sha256
	       (base32
		"1apc6d7d5279psy4nikw2y31zwwlanq5fq2dqrzsh5a9hkiav1yw"))))
     (build-system gnu-build-system)
     (home-page "https://github.com/AmineKhaldi/libsodium-cmake")
     (synopsis "Wrapper around the libsodium repository providing good integration with CMake when using FetchContent or adding it as a submodule.")
     (description "Wrapper around the libsodium repository providing good integration with CMake when using FetchContent or adding it as a submodule.")
     (license license:isc))))
