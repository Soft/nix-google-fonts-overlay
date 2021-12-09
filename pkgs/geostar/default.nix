{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geostar-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/geostar/Geostar-Regular.ttf?raw=true";
      name = "Geostar-Regular.ttf";
      sha256 = "891b92c124bbe4ac006c0b8b7402215486b7cb7951488178f415694a5898d12b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Geostar-Regular.ttf $out/share/fonts/truetype/Geostar-Regular.ttf
  '';

  meta = with lib; {
    description = "Geostar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
