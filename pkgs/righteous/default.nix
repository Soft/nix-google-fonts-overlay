{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "righteous-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/righteous/Righteous-Regular.ttf?raw=true";
      name = "Righteous-Regular.ttf";
      sha256 = "2ffb3fe5c27d7e6571210b800448c4e234e651b46c6b4426c1bb567e5341348a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Righteous-Regular.ttf $out/share/fonts/truetype/Righteous-Regular.ttf
  '';

  meta = with lib; {
    description = "Righteous";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
