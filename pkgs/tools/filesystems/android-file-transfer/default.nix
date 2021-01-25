{ lib, mkDerivation, fetchFromGitHub, cmake, fuse, readline, pkg-config, qtbase, qttools }:

mkDerivation rec {
  pname = "android-file-transfer";
  version = "4.2";

  src = fetchFromGitHub {
    owner = "whoozle";
    repo = "android-file-transfer-linux";
    rev = "v${version}";
    sha256 = "125rq8ji83nw6chfw43i0h9c38hjqh1qjibb0gnf9wrigar9zc8b";
  };

  nativeBuildInputs = [ cmake readline pkg-config ];
  buildInputs = [ fuse qtbase qttools ];

  meta = with lib; {
    description = "Reliable MTP client with minimalistic UI";
    homepage = "https://whoozle.github.io/android-file-transfer-linux/";
    license = licenses.lgpl21Plus;
    maintainers = [ maintainers.xaverdh ];
    platforms = platforms.linux;
  };
}
