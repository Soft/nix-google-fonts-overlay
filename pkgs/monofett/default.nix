{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monofett-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/monofett/Monofett.ttf?raw=true";
      name = "Monofett.ttf";
      sha256 = "05c225ab2653d62e9aeef6a78693d6c990383d3253daece8bedc5964231d5c52";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monofett.ttf $out/share/fonts/truetype/Monofett.ttf
  '';

  meta = with lib; {
    description = "Monofett";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
