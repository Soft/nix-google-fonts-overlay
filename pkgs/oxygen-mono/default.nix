{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oxygen-mono-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/oxygenmono/OxygenMono-Regular.ttf?raw=true";
      name = "OxygenMono-Regular.ttf";
      sha256 = "dcc671da93f7fc31f2e7a4a7c058c815c1eaec6a3d27792e18edff4d3bf539f0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OxygenMono-Regular.ttf $out/share/fonts/truetype/OxygenMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Oxygen Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
