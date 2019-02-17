{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "passero-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/passeroone/PasseroOne-Regular.ttf?raw=true";
      name = "PasseroOne-Regular.ttf";
      sha256 = "b5170ecc855200d369f8a60fc8c0c351cc8cb5ec9fab9a838d5a27f34e01982d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PasseroOne-Regular.ttf $out/share/fonts/truetype/PasseroOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Passero One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
