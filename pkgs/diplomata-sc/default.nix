{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "diplomata-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/diplomatasc/DiplomataSC-Regular.ttf?raw=true";
      name = "DiplomataSC-Regular.ttf";
      sha256 = "d4e03c50fd14c8d1b89b8340d353c8c56b22afbb19db975ef559a19f503b215e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DiplomataSC-Regular.ttf $out/share/fonts/truetype/DiplomataSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Diplomata SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
