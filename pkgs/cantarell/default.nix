{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantarell-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cantarell/Cantarell-Regular.ttf?raw=true";
      name = "Cantarell-Regular.ttf";
      sha256 = "d03f8b39000d1d01266ba4447a1bbb8d59d71f3d95afb6d3d0a729120bdd2613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cantarell/Cantarell-Oblique.ttf?raw=true";
      name = "Cantarell-Oblique.ttf";
      sha256 = "d4950ca33b67c41c04ef669c6eac6e4dc859e2dc90c15c935dfc251f0323a9c7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cantarell/Cantarell-Bold.ttf?raw=true";
      name = "Cantarell-Bold.ttf";
      sha256 = "36577248c6f678c93cf60fcac4c781e655d9ae0626937d3dcc96101a273e7a0a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cantarell/Cantarell-BoldOblique.ttf?raw=true";
      name = "Cantarell-BoldOblique.ttf";
      sha256 = "232a7f4a2f5030f0e641e57462dbc263cf9b5326dce4c694f0a09852176bd564";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cantarell-Regular.ttf $out/share/fonts/truetype/Cantarell-Regular.ttf
     install -Dm644 Cantarell-Oblique.ttf $out/share/fonts/truetype/Cantarell-Oblique.ttf
     install -Dm644 Cantarell-Bold.ttf $out/share/fonts/truetype/Cantarell-Bold.ttf
     install -Dm644 Cantarell-BoldOblique.ttf $out/share/fonts/truetype/Cantarell-BoldOblique.ttf
  '';

  meta = with lib; {
    description = "Cantarell";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
