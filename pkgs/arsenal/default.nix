{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arsenal-${version}";
  version = "2016-12-06-100542";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f6c0a183f9d435853bef472301f83ea3902ff69/ofl/arsenal/Arsenal-Regular.ttf?raw=true";
      name = "Arsenal-Regular.ttf";
      sha256 = "544784eccc5405570c8d91419739a12c2a9ee7cfc947715cee51fa060701b4c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f6c0a183f9d435853bef472301f83ea3902ff69/ofl/arsenal/Arsenal-Italic.ttf?raw=true";
      name = "Arsenal-Italic.ttf";
      sha256 = "3e38a69ce81ed89b8a1fe20cb1eecbad762aad58c122ea8438bdb8be40ed550c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f6c0a183f9d435853bef472301f83ea3902ff69/ofl/arsenal/Arsenal-Bold.ttf?raw=true";
      name = "Arsenal-Bold.ttf";
      sha256 = "eeaf97f8df9d5bb69c8db23f7d2ace61b6e4eeefd99c1a226f0577a0b3a23fe4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f6c0a183f9d435853bef472301f83ea3902ff69/ofl/arsenal/Arsenal-BoldItalic.ttf?raw=true";
      name = "Arsenal-BoldItalic.ttf";
      sha256 = "276c72baa7fc670e03c2951fb10be5d75c3e0c852111a10a84c8e0c739fed90c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arsenal-Regular.ttf $out/share/fonts/truetype/Arsenal-Regular.ttf
     install -Dm644 Arsenal-Italic.ttf $out/share/fonts/truetype/Arsenal-Italic.ttf
     install -Dm644 Arsenal-Bold.ttf $out/share/fonts/truetype/Arsenal-Bold.ttf
     install -Dm644 Arsenal-BoldItalic.ttf $out/share/fonts/truetype/Arsenal-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Arsenal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
