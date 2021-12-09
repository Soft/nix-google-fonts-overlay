{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-outline-${version}";
  version = "2017-05-23-170731";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ca9abdfc48ea07af585e59d2d489c4114620e118/ofl/bungeeoutline/BungeeOutline-Regular.ttf?raw=true";
      name = "BungeeOutline-Regular.ttf";
      sha256 = "b0fb42b0a0ecd833b7d4747184631a5968f5a2025721d264c0ef13ab5580a6cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeOutline-Regular.ttf $out/share/fonts/truetype/BungeeOutline-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Outline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
