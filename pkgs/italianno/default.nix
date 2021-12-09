{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "italianno-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/italianno/Italianno-Regular.ttf?raw=true";
      name = "Italianno-Regular.ttf";
      sha256 = "d5987ea9f323bafd7e35282e0ee938aca0a2986ca56100e657cce3a0c7f23755";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Italianno-Regular.ttf $out/share/fonts/truetype/Italianno-Regular.ttf
  '';

  meta = with lib; {
    description = "Italianno";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
