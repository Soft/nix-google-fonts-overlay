{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "loved-by-the-king-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lovedbytheking/LovedbytheKing.ttf?raw=true";
      name = "LovedbytheKing.ttf";
      sha256 = "1d2fce705c902a0c47264992e698ce76336013458f0612cc68917025ca6fcfb3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LovedbytheKing.ttf $out/share/fonts/truetype/LovedbytheKing.ttf
  '';

  meta = with lib; {
    description = "Loved by the King";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
