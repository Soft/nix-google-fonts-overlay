{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cabin-sketch-${version}";
  version = "2016-12-05-225801";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f5b5570350b5fa778d3b8a01a05a112e507a655/ofl/cabinsketch/CabinSketch-Regular.ttf?raw=true";
      name = "CabinSketch-Regular.ttf";
      sha256 = "a6f989fcc910ca321e06cd6a20dbcab20f9e41bce084911432857cfe286355e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f5b5570350b5fa778d3b8a01a05a112e507a655/ofl/cabinsketch/CabinSketch-Bold.ttf?raw=true";
      name = "CabinSketch-Bold.ttf";
      sha256 = "0961688037b97947495c2e35e6e5a93f2b234490514e33346605ffedf9c7e6be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CabinSketch-Regular.ttf $out/share/fonts/truetype/CabinSketch-Regular.ttf
     install -Dm644 CabinSketch-Bold.ttf $out/share/fonts/truetype/CabinSketch-Bold.ttf
  '';

  meta = with lib; {
    description = "Cabin Sketch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
