{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruge-boogie-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rugeboogie/RugeBoogie-Regular.ttf?raw=true";
      name = "RugeBoogie-Regular.ttf";
      sha256 = "b72d7c8b9355a1b282207dc19d85b5728e004e1f0d37f2af28ba6092f79369c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RugeBoogie-Regular.ttf $out/share/fonts/truetype/RugeBoogie-Regular.ttf
  '';

  meta = with lib; {
    description = "Ruge Boogie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
