{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fjord-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/fjordone/FjordOne-Regular.ttf?raw=true";
      name = "FjordOne-Regular.ttf";
      sha256 = "e589e22412b5382c1a4ec482af28c515d9c794ce8bde9a4c2db8ef2a6a063d86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FjordOne-Regular.ttf $out/share/fonts/truetype/FjordOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fjord One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
