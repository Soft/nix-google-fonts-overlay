{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playball-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/playball/Playball-Regular.ttf?raw=true";
      name = "Playball-Regular.ttf";
      sha256 = "3985700143687aa5d575b736abec8ef82170127494760393d826d7490f25e46b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Playball-Regular.ttf $out/share/fonts/truetype/Playball-Regular.ttf
  '';

  meta = with lib; {
    description = "Playball";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
