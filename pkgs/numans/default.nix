{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "numans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/numans/Numans-Regular.ttf?raw=true";
      name = "Numans-Regular.ttf";
      sha256 = "d331ef3473572f5eb0dd05b6de238b65b4d875eb1c5296e18225a7b4e64436f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Numans-Regular.ttf $out/share/fonts/truetype/Numans-Regular.ttf
  '';

  meta = with lib; {
    description = "Numans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
