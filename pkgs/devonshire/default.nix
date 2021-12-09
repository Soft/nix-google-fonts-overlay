{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "devonshire-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/devonshire/Devonshire-Regular.ttf?raw=true";
      name = "Devonshire-Regular.ttf";
      sha256 = "4c00f003570e5a99361cc83017cb1314aa3170cfaa53be29a08c555bbb434657";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Devonshire-Regular.ttf $out/share/fonts/truetype/Devonshire-Regular.ttf
  '';

  meta = with lib; {
    description = "Devonshire";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
