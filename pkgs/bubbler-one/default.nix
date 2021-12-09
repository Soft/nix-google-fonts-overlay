{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bubbler-one-${version}";
  version = "2017-08-07-200825";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/70a30639c1fc5d61726c0b06e8f64738d5927b18/ofl/bubblerone/BubblerOne-Regular.ttf?raw=true";
      name = "BubblerOne-Regular.ttf";
      sha256 = "7994c6379c0405aba9b3459f3afa075959297e2a5b3e0827b41a82c53530d4ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BubblerOne-Regular.ttf $out/share/fonts/truetype/BubblerOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bubbler One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
