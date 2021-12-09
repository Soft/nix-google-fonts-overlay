{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orienta-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/orienta/Orienta-Regular.ttf?raw=true";
      name = "Orienta-Regular.ttf";
      sha256 = "a5abf818a4fdfcdeea109e3bb8b4bd1c94e4c914dca76ab04d01183fba2179da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Orienta-Regular.ttf $out/share/fonts/truetype/Orienta-Regular.ttf
  '';

  meta = with lib; {
    description = "Orienta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
