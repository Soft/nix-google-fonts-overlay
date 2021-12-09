{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "piedra-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/piedra/Piedra-Regular.ttf?raw=true";
      name = "Piedra-Regular.ttf";
      sha256 = "2e9d00f94d3d78f38618250d03d3e8bccca541c956d5e0a437c62d708ef6c1da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Piedra-Regular.ttf $out/share/fonts/truetype/Piedra-Regular.ttf
  '';

  meta = with lib; {
    description = "Piedra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
