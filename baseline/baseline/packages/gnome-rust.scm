(define-module (baseline packages gnome-rust)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (gnu packages crates-gtk)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public rust-gnome-randr-0.1
  (package
   (name "rust-gnome-randr")
   (version "0.1.1")
   (source
    (origin
     (method url-fetch)
     (uri (crate-uri "gnome-randr" version))
     (file-name (string-append name "-" version ".tar.gz"))
     (sha256
      (base32 "1xbgwpq6fjp4767fgi8rnsw5vy4mvj2b5xrzm3cd8sdyr78kb40r"))))
   (build-system cargo-build-system)
   (native-inputs
    (list pkg-config))
   (inputs
    (list dbus))
   (arguments
    `(#:cargo-inputs
      (("rust-bitflags" ,rust-bitflags-1)
       ("rust-dbus" ,rust-dbus-0.9)
       ("rust-structopt" ,rust-structopt-0.3))))
   (home-page "https://github.com/maxwellainatchi/gnome-randr-rust")
   (synopsis "A reimplementation of xrandr for Gnome on Wayland")
   (description
    "This package provides a reimplementation of xrandr for Gnome on Wayland")
   (license license:expat)))

(define-public rust-dbus-0.9
  (package
    (name "rust-dbus")
    (version "0.9.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dbus" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1kn2v0w0q2q608xwl42c1yb3m2f7zvsm0f9ap1balb5k4mf782ny"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-futures-channel" ,rust-futures-channel-0.3)
         ("rust-futures-executor" ,rust-futures-executor-0.3)
         ("rust-futures-util" ,rust-futures-util-0.3)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libdbus-sys" ,rust-libdbus-sys-0.2)
         ("rust-winapi" ,rust-winapi-0.3))
        #:cargo-development-inputs
        (("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/diwic/dbus-rs")
    (synopsis
      "Bindings to D-Bus, which is a bus commonly used on Linux for inter-process communication.")
    (description
      "Bindings to D-Bus, which is a bus commonly used on Linux for inter-process
communication.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-0.3
  (package
    (name "rust-structopt")
    (version "0.3.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "043sg3qxllann6q9i71d05qp3q13scmcvhxhd950ka2v8ij5qsqc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-clap" ,rust-clap-2)
         ("rust-lazy-static" ,rust-lazy-static-1)
         ("rust-paw" ,rust-paw-1)
         ("rust-structopt-derive" ,rust-structopt-derive-0.4))
        #:cargo-development-inputs
        (("rust-rustversion" ,rust-rustversion-1)
         ("rust-strum" ,rust-strum-0.21)
         ("rust-trybuild" ,rust-trybuild-1))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis "Parse command line argument by defining a struct.")
    (description "Parse command line argument by defining a struct.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-libdbus-sys-0.2
  (package
   (name "rust-libdbus-sys")
   (version "0.2.2")
   (source
    (origin
     (method url-fetch)
     (uri (crate-uri "libdbus-sys" version))
     (file-name (string-append name "-" version ".tar.gz"))
     (sha256
      (base32 "0ss51n616qr36jw34kxvh3m5m6sd7l499xcg7bpj62chmnvvb1f1"))))
   (build-system cargo-build-system)
   (native-inputs
    (list pkg-config))
   (inputs
    (list dbus))
   (arguments `(#:cargo-inputs (("rust-pkg-config" ,rust-pkg-config-0.3))))
   (home-page "https://github.com/diwic/dbus-rs")
   (synopsis "FFI bindings to libdbus.")
   (description "FFI bindings to libdbus.")
   (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-derive-0.4
  (package
    (name "rust-structopt-derive")
    (version "0.4.18")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt-derive" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
          (base32 "1q5gcigmvw0cinjxzpyrkflliq5r1ivljmrvfrl3phcwgwraxdfw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-heck" ,rust-heck-0.3)
         ("rust-proc-macro-error" ,rust-proc-macro-error-1)
         ("rust-proc-macro2" ,rust-proc-macro2-1)
         ("rust-quote" ,rust-quote-1)
         ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis
      "Parse command line argument by defining a struct, derive crate.")
    (description
      "Parse command line argument by defining a struct, derive crate.")
    (license (list license:asl2.0 license:expat))))
