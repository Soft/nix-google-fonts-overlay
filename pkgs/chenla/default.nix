{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chenla-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/chenla/Chenla.ttf?raw=true";
      name = "Chenla.ttf";
      sha256 = "ebc79ffc924df0c0302a46322e0427b1a79da1a1b61267513fa1c286ba99f73c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chenla.ttf $out/share/fonts/truetype/Chenla.ttf
  '';

  meta = with lib; {
    description = "Chenla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
