{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "preahvihear-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/preahvihear/Preahvihear.ttf?raw=true";
      name = "Preahvihear.ttf";
      sha256 = "c4b725aa149e48d130cf6de5a64ef78d7a1309832b7425f6f9c4a888a0b65482";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Preahvihear.ttf $out/share/fonts/truetype/Preahvihear.ttf
  '';

  meta = with lib; {
    description = "Preahvihear";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
