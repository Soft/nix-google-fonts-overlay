{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ledger-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ledger/Ledger-Regular.ttf?raw=true";
      name = "Ledger-Regular.ttf";
      sha256 = "4d0df6f0a3c259ca3afd3027d28d46c4cd171270f22c8c69836e5cd1f250197d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ledger-Regular.ttf $out/share/fonts/truetype/Ledger-Regular.ttf
  '';

  meta = with lib; {
    description = "Ledger";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
