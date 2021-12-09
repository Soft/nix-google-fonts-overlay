{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merienda-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/meriendaone/MeriendaOne-Regular.ttf?raw=true";
      name = "MeriendaOne-Regular.ttf";
      sha256 = "6fa8eb256e03872f0f8b41b317eb3ebb008abaabbad9e83e0cd1234d899c5543";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeriendaOne-Regular.ttf $out/share/fonts/truetype/MeriendaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Merienda One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
