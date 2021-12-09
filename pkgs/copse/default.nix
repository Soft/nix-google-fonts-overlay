{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "copse-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/copse/Copse-Regular.ttf?raw=true";
      name = "Copse-Regular.ttf";
      sha256 = "b852e682f0c66de4db1835f8545ff2e94761549987a4607447b069e973f50b1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Copse-Regular.ttf $out/share/fonts/truetype/Copse-Regular.ttf
  '';

  meta = with lib; {
    description = "Copse";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
