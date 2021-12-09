{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lemon-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lemon/Lemon-Regular.ttf?raw=true";
      name = "Lemon-Regular.ttf";
      sha256 = "7ded93fde4589c3cc32052da187d0bcbf023dfb53af1a8b4ce847d47ad9add33";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lemon-Regular.ttf $out/share/fonts/truetype/Lemon-Regular.ttf
  '';

  meta = with lib; {
    description = "Lemon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
