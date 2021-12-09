{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fauna-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/faunaone/FaunaOne-Regular.ttf?raw=true";
      name = "FaunaOne-Regular.ttf";
      sha256 = "57326459715c908b2f74b990da53e4f255ab4ab31d862d8cfd3689b0ab9c1b6d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FaunaOne-Regular.ttf $out/share/fonts/truetype/FaunaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fauna One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
