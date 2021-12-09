{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vibur-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/vibur/Vibur-Regular.ttf?raw=true";
      name = "Vibur-Regular.ttf";
      sha256 = "3e23653e2f0abfa88ae499d1265f1b80055b6caf52fe32b1586eb7d294227bb1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vibur-Regular.ttf $out/share/fonts/truetype/Vibur-Regular.ttf
  '';

  meta = with lib; {
    description = "Vibur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
