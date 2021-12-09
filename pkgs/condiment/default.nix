{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "condiment-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/condiment/Condiment-Regular.ttf?raw=true";
      name = "Condiment-Regular.ttf";
      sha256 = "fb12978739fe3824e95b3e5f739ae623f888f715fe44481117fb3436be9a4b5d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Condiment-Regular.ttf $out/share/fonts/truetype/Condiment-Regular.ttf
  '';

  meta = with lib; {
    description = "Condiment";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
