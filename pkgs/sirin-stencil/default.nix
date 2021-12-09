{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sirin-stencil-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sirinstencil/SirinStencil-Regular.ttf?raw=true";
      name = "SirinStencil-Regular.ttf";
      sha256 = "0e231c6220787179588fe8b1c8921bff70207f1f556a6ef7e35e46ae04352b2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SirinStencil-Regular.ttf $out/share/fonts/truetype/SirinStencil-Regular.ttf
  '';

  meta = with lib; {
    description = "Sirin Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
