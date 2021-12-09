{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mr-dafoe-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrdafoe/MrDafoe-Regular.ttf?raw=true";
      name = "MrDafoe-Regular.ttf";
      sha256 = "a42a3c66a709927f358243fdfcbc437bd8eb188e2ee6a680c52f5be12c670fd2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrDafoe-Regular.ttf $out/share/fonts/truetype/MrDafoe-Regular.ttf
  '';

  meta = with lib; {
    description = "Mr Dafoe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
