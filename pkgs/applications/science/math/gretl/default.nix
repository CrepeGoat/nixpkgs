{ lib
, stdenv
, fetchurl
, curl
, fftw
, gmp
, gnuplot
, gtk3
, gtksourceview3
, json-glib
, lapack
, libxml2
, mpfr
, openblas
, readline
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "gretl";
  version = "2023b";

  src = fetchurl {
    url = "mirror://sourceforge/gretl/${pname}-${version}.tar.xz";
    hash = "sha256-Hf025JjFxde43TN/1m9PeA1uHqxKTZMI8+1qf3XJLGs=";
  };

  buildInputs = [
    curl
    fftw
    gmp
    gnuplot
    gtk3
    gtksourceview3
    json-glib
    lapack
    libxml2
    mpfr
    openblas
    readline
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  enableParallelBuilding = true;
  # Missing install depends:
  #  cp: cannot stat '...-gretl-2022c/share/gretl/data/plotbars': Not a directory
  #  make[1]: *** [Makefile:73: install_datafiles] Error 1
  enableParallelInstalling = false;

  meta = {
    description = "A software package for econometric analysis";
    homepage = "https://gretl.sourceforge.net";
    license = lib.licenses.gpl3;
    longDescription = ''
      gretl is a cross-platform software package for econometric analysis,
      written in the C programming language.
    '';
    maintainers = with lib.maintainers; [ dmrauh ];
    platforms = lib.platforms.all;
  };
}
