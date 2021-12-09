{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "macondo-swash-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/macondoswashcaps/MacondoSwashCaps-Regular.ttf?raw=true";
      name = "MacondoSwashCaps-Regular.ttf";
      sha256 = "776c95ad520e4776a45add8d8693e693b566be9f26cd20505256c8e944dc07ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MacondoSwashCaps-Regular.ttf $out/share/fonts/truetype/MacondoSwashCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Macondo Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
