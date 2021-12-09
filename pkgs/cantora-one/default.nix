{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantora-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cantoraone/CantoraOne-Regular.ttf?raw=true";
      name = "CantoraOne-Regular.ttf";
      sha256 = "0a41216a2daa8f0fd7e23bc51fefd6bbabe4565db23c4df7d7956e3fc8b8213b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CantoraOne-Regular.ttf $out/share/fonts/truetype/CantoraOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Cantora One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
