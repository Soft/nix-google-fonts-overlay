{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dr-sugiyama-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/drsugiyama/DrSugiyama-Regular.ttf?raw=true";
      name = "DrSugiyama-Regular.ttf";
      sha256 = "8436c1eae3a06126a6e0aa85b1dffb1b507d39eab7b6512a9bb1adc5d514d9b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DrSugiyama-Regular.ttf $out/share/fonts/truetype/DrSugiyama-Regular.ttf
  '';

  meta = with lib; {
    description = "Dr Sugiyama";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
