{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmbx10-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/jsmathcmbx10/jsMath-cmbx10.ttf?raw=true";
      name = "jsMath-cmbx10.ttf";
      sha256 = "e4aa545e2391f90f9c6c823e67ab0b682a6a8e1711f72a2ffc120458b519fac4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmbx10.ttf $out/share/fonts/truetype/jsMath-cmbx10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmbx10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
