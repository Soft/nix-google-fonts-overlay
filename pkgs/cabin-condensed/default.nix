{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cabin-condensed-${version}";
  version = "2017-05-01-173743";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eef4029d7d15253b0dd7e62ccbc2b3bf5d0024fe/ofl/cabincondensed/CabinCondensed-Regular.ttf?raw=true";
      name = "CabinCondensed-Regular.ttf";
      sha256 = "d3ad2ca1872bc3a8664ba913314b2f85fef015d0a7cb3007a7ca6420b84e574d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eef4029d7d15253b0dd7e62ccbc2b3bf5d0024fe/ofl/cabincondensed/CabinCondensed-Medium.ttf?raw=true";
      name = "CabinCondensed-Medium.ttf";
      sha256 = "08475cc737055f1c08eb1fbcad084abd9d4d0342cb55b3a76e9114cab99ad9e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eef4029d7d15253b0dd7e62ccbc2b3bf5d0024fe/ofl/cabincondensed/CabinCondensed-SemiBold.ttf?raw=true";
      name = "CabinCondensed-SemiBold.ttf";
      sha256 = "a73b89d750f03af8a6cd8783678cd163ec78f9e2c603d2389548fbb8dfc5d62b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eef4029d7d15253b0dd7e62ccbc2b3bf5d0024fe/ofl/cabincondensed/CabinCondensed-Bold.ttf?raw=true";
      name = "CabinCondensed-Bold.ttf";
      sha256 = "55c7759cde62445fe60d36df812f83ad2f720929628040f2a036e1e8c6e48671";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CabinCondensed-Regular.ttf $out/share/fonts/truetype/CabinCondensed-Regular.ttf
     install -Dm644 CabinCondensed-Medium.ttf $out/share/fonts/truetype/CabinCondensed-Medium.ttf
     install -Dm644 CabinCondensed-SemiBold.ttf $out/share/fonts/truetype/CabinCondensed-SemiBold.ttf
     install -Dm644 CabinCondensed-Bold.ttf $out/share/fonts/truetype/CabinCondensed-Bold.ttf
  '';

  meta = with lib; {
    description = "Cabin Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
