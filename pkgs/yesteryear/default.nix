{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yesteryear-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/yesteryear/Yesteryear-Regular.ttf?raw=true";
      name = "Yesteryear-Regular.ttf";
      sha256 = "17d1b2c57ec648ff9b13d2000bdd9b5c1c326ba14acff4597afe3a730d0a2c94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yesteryear-Regular.ttf $out/share/fonts/truetype/Yesteryear-Regular.ttf
  '';

  meta = with lib; {
    description = "Yesteryear";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
