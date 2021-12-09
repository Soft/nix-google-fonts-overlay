{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hermeneus-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/hermeneusone/HermeneusOne-Regular.ttf?raw=true";
      name = "HermeneusOne-Regular.ttf";
      sha256 = "53ff8b668ff603beb3a15b298c35d80932f57a47c889e6e96bb93d434da25808";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HermeneusOne-Regular.ttf $out/share/fonts/truetype/HermeneusOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Hermeneus One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
