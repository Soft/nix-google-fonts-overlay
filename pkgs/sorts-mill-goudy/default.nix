{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sorts-mill-goudy-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sortsmillgoudy/SortsMillGoudy-Regular.ttf?raw=true";
      name = "SortsMillGoudy-Regular.ttf";
      sha256 = "3a1fdc0d151b29c562ad3f3b7d7cabf007783ba4dc69444d3a98666bb614352d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sortsmillgoudy/SortsMillGoudy-Italic.ttf?raw=true";
      name = "SortsMillGoudy-Italic.ttf";
      sha256 = "7a7720703749c74b657f5340eda5374d0b87a9653855d5cd2f23cc1083d9b0f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SortsMillGoudy-Regular.ttf $out/share/fonts/truetype/SortsMillGoudy-Regular.ttf
     install -Dm644 SortsMillGoudy-Italic.ttf $out/share/fonts/truetype/SortsMillGoudy-Italic.ttf
  '';

  meta = with lib; {
    description = "Sorts Mill Goudy";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
