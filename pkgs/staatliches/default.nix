{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "staatliches-${version}";
  version = "2018-12-10-221713";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d3c26bee29d997c0ee152d2acb96b013321482b9/ofl/staatliches/Staatliches-Regular.ttf?raw=true";
      name = "Staatliches-Regular.ttf";
      sha256 = "8395212aa4c6c3534bd39a745d956305ff080c3f3ed73ba61e4fbaae951e55cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Staatliches-Regular.ttf $out/share/fonts/truetype/Staatliches-Regular.ttf
  '';

  meta = with lib; {
    description = "Staatliches";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
