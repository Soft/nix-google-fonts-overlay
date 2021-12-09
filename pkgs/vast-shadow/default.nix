{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vast-shadow-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/vastshadow/VastShadow-Regular.ttf?raw=true";
      name = "VastShadow-Regular.ttf";
      sha256 = "98bdf7f93c2330697078ece27e48dea7d97b253a547d699bf7afc4bdfa641a93";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VastShadow-Regular.ttf $out/share/fonts/truetype/VastShadow-Regular.ttf
  '';

  meta = with lib; {
    description = "Vast Shadow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
