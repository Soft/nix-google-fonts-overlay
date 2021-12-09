{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chelsea-market-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/chelseamarket/ChelseaMarket-Regular.ttf?raw=true";
      name = "ChelseaMarket-Regular.ttf";
      sha256 = "7243be29a2d74e6a826e1091f74c89e58cc8010047c6db8de13f616e81b1f5f2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChelseaMarket-Regular.ttf $out/share/fonts/truetype/ChelseaMarket-Regular.ttf
  '';

  meta = with lib; {
    description = "Chelsea Market";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
