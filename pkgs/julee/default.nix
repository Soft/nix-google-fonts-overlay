{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "julee-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/julee/Julee-Regular.ttf?raw=true";
      name = "Julee-Regular.ttf";
      sha256 = "788f6a017f798eda1ee65420ad93b7e0966953ebd585c53b98889b61826268de";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Julee-Regular.ttf $out/share/fonts/truetype/Julee-Regular.ttf
  '';

  meta = with lib; {
    description = "Julee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
