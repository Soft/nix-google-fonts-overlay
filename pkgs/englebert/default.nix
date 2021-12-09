{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "englebert-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/englebert/Englebert-Regular.ttf?raw=true";
      name = "Englebert-Regular.ttf";
      sha256 = "e7c5cf4ffa49ba93289a0434f7db8bf784983a97734588871cd93965ce5efd33";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Englebert-Regular.ttf $out/share/fonts/truetype/Englebert-Regular.ttf
  '';

  meta = with lib; {
    description = "Englebert";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
