{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bree-serif-${version}";
  version = "2017-08-07-200852";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/faaf4889d443cab28f6bd0632a380506f338303d/ofl/breeserif/BreeSerif-Regular.ttf?raw=true";
      name = "BreeSerif-Regular.ttf";
      sha256 = "fd080582d70112ef479ba4ddd72407f9a4fcbcec4caa7d29de259b13eeb5f431";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BreeSerif-Regular.ttf $out/share/fonts/truetype/BreeSerif-Regular.ttf
  '';

  meta = with lib; {
    description = "Bree Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
