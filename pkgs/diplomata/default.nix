{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "diplomata-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/diplomata/Diplomata-Regular.ttf?raw=true";
      name = "Diplomata-Regular.ttf";
      sha256 = "a02adc3d8790dfac28e3ff841a63529024c93233fd6acdede0b044ce1a425477";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Diplomata-Regular.ttf $out/share/fonts/truetype/Diplomata-Regular.ttf
  '';

  meta = with lib; {
    description = "Diplomata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
