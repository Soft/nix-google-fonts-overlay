{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruthie-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ruthie/Ruthie-Regular.ttf?raw=true";
      name = "Ruthie-Regular.ttf";
      sha256 = "7c5a1bfbcd9b0bf6f709686bdcefa4b06305f60fecdd290c1c2782de31559232";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruthie-Regular.ttf $out/share/fonts/truetype/Ruthie-Regular.ttf
  '';

  meta = with lib; {
    description = "Ruthie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
