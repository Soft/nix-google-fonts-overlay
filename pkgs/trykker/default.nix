{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trykker-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/trykker/Trykker-Regular.ttf?raw=true";
      name = "Trykker-Regular.ttf";
      sha256 = "bb5601709cfa4c0b28725afd45025afc79310738886d89ced9caa36164bd217a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trykker-Regular.ttf $out/share/fonts/truetype/Trykker-Regular.ttf
  '';

  meta = with lib; {
    description = "Trykker";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
