{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pompiere-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/pompiere/Pompiere-Regular.ttf?raw=true";
      name = "Pompiere-Regular.ttf";
      sha256 = "e983b7f9f2d57779855a6e571fd7c335c335c4256d64d6551efea3bfb486ca6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pompiere-Regular.ttf $out/share/fonts/truetype/Pompiere-Regular.ttf
  '';

  meta = with lib; {
    description = "Pompiere";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
