{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caveat-brush-${version}";
  version = "2016-05-26-000618";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b05d7ed92bc2424f4dd1d2c5861a423868dea932/ofl/caveatbrush/CaveatBrush-Regular.ttf?raw=true";
      name = "CaveatBrush-Regular.ttf";
      sha256 = "e565bd7bffd895ca64f8d1cb77c816b9b38d9c010246386a07c9648592f6f282";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CaveatBrush-Regular.ttf $out/share/fonts/truetype/CaveatBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Caveat Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
