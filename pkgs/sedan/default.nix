{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedan-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sedan/Sedan-Regular.ttf?raw=true";
      name = "Sedan-Regular.ttf";
      sha256 = "d3a77b907804d1ca4bf9532a3225db588d15fd75cf9d3c11f305dd693c85f02e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sedan/Sedan-Italic.ttf?raw=true";
      name = "Sedan-Italic.ttf";
      sha256 = "99290cd3dcd1a56a0fa3360727ec2dac2bb2b1ddb0708fa1c6cc8e5d246c30f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sedan-Regular.ttf $out/share/fonts/truetype/Sedan-Regular.ttf
     install -Dm644 Sedan-Italic.ttf $out/share/fonts/truetype/Sedan-Italic.ttf
  '';

  meta = with lib; {
    description = "Sedan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
