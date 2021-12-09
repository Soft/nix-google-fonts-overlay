{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "imprima-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imprima/Imprima-Regular.ttf?raw=true";
      name = "Imprima-Regular.ttf";
      sha256 = "069f3d0c87bae5d21be3b86f1b59aad3180121a26f8db6f58e7f37d9c20b6c32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Imprima-Regular.ttf $out/share/fonts/truetype/Imprima-Regular.ttf
  '';

  meta = with lib; {
    description = "Imprima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
