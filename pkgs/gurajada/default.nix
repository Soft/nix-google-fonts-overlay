{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gurajada-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gurajada/Gurajada-Regular.ttf?raw=true";
      name = "Gurajada-Regular.ttf";
      sha256 = "353c1289a6f4ba743154c870418272cf68e0f63c0c38598ed33cba814d3178e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gurajada-Regular.ttf $out/share/fonts/truetype/Gurajada-Regular.ttf
  '';

  meta = with lib; {
    description = "Gurajada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
