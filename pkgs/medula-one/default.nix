{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "medula-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/medulaone/MedulaOne-Regular.ttf?raw=true";
      name = "MedulaOne-Regular.ttf";
      sha256 = "ec96fcb6468878d6ce17334214421f4c01bb97ebe0a89bee6e22352929f60f2a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MedulaOne-Regular.ttf $out/share/fonts/truetype/MedulaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Medula One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
