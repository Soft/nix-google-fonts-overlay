{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "warnes-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/warnes/Warnes-Regular.ttf?raw=true";
      name = "Warnes-Regular.ttf";
      sha256 = "2dc982bec57f86da62c214bfb279ffea2690ab97be8c0b4e83f32e7c508e4798";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Warnes-Regular.ttf $out/share/fonts/truetype/Warnes-Regular.ttf
  '';

  meta = with lib; {
    description = "Warnes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
