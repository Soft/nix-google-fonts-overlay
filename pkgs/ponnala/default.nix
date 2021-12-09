{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ponnala-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ponnala/Ponnala-Regular.ttf?raw=true";
      name = "Ponnala-Regular.ttf";
      sha256 = "7febc4f7f386e8fe4485a7579ebadafb8c5d5eeb05660bf35eda33d11f2ed81e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ponnala-Regular.ttf $out/share/fonts/truetype/Ponnala-Regular.ttf
  '';

  meta = with lib; {
    description = "Ponnala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
