{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-double-pica-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfelldoublepica/IMFeDPrm28P.ttf?raw=true";
      name = "IMFeDPrm28P.ttf";
      sha256 = "52918e154664cc64129ce9ac5670b61d42f5bc52058e08d5533370d4b67f2499";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfelldoublepica/IMFeDPit28P.ttf?raw=true";
      name = "IMFeDPit28P.ttf";
      sha256 = "00ac0e73855f16e7192a76bc284fb86f69b2f2c21b405e29991f99ece83d6391";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeDPrm28P.ttf $out/share/fonts/truetype/IMFeDPrm28P.ttf
     install -Dm644 IMFeDPit28P.ttf $out/share/fonts/truetype/IMFeDPit28P.ttf
  '';

  meta = with stdenv.lib; {
    description = "IM Fell Double Pica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
