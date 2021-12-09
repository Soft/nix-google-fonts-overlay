{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sancreek-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sancreek/Sancreek-Regular.ttf?raw=true";
      name = "Sancreek-Regular.ttf";
      sha256 = "e6044ed733dc0d5b000cfa35cead2b800bc1f850e5a92bb3f532b28f8281ee8d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sancreek-Regular.ttf $out/share/fonts/truetype/Sancreek-Regular.ttf
  '';

  meta = with lib; {
    description = "Sancreek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
