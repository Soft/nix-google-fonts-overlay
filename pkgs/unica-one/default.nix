{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unica-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/unicaone/UnicaOne-Regular.ttf?raw=true";
      name = "UnicaOne-Regular.ttf";
      sha256 = "b61df83878f3bb84956eae118c870aea30b88e7508ce419c00f79e65e4da1add";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UnicaOne-Regular.ttf $out/share/fonts/truetype/UnicaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Unica One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
