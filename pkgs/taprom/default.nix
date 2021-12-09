{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "taprom-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/taprom/Taprom.ttf?raw=true";
      name = "Taprom.ttf";
      sha256 = "e3f9956715ab5c3d759921571b07a0e8cbc454e5f405c456b0482867e2b146d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Taprom.ttf $out/share/fonts/truetype/Taprom.ttf
  '';

  meta = with lib; {
    description = "Taprom";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
