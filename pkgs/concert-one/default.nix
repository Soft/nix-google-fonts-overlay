{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "concert-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/concertone/ConcertOne-Regular.ttf?raw=true";
      name = "ConcertOne-Regular.ttf";
      sha256 = "1651e05fba9a75b10a5c5c5bd83de642cbd47e820a9639a3f1592c8eb5d0342c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ConcertOne-Regular.ttf $out/share/fonts/truetype/ConcertOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Concert One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
