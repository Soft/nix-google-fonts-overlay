{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rubikone/RubikOne-Regular.ttf?raw=true";
      name = "RubikOne-Regular.ttf";
      sha256 = "fced18ce7220d7504aba15adebd58f63d29eca554180aa74ea7545c9e07e6548";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikOne-Regular.ttf $out/share/fonts/truetype/RubikOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
