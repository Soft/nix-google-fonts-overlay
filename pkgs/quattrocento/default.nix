{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quattrocento-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocento/Quattrocento-Regular.ttf?raw=true";
      name = "Quattrocento-Regular.ttf";
      sha256 = "57dc8daff9121be82e54cf1221658b7ba4f1801212817aead2d184a5660fbcb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quattrocento/Quattrocento-Bold.ttf?raw=true";
      name = "Quattrocento-Bold.ttf";
      sha256 = "5945de7b6d6c7c9fefbb67bc34ec60f64a7dd1bd645fb2771ec7728c0ab67c9d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quattrocento-Regular.ttf $out/share/fonts/truetype/Quattrocento-Regular.ttf
     install -Dm644 Quattrocento-Bold.ttf $out/share/fonts/truetype/Quattrocento-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Quattrocento";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
