{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fresca-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/fresca/Fresca-Regular.ttf?raw=true";
      name = "Fresca-Regular.ttf";
      sha256 = "f64340016a820093202ca6af533f232ee7fe4c3d8448601ac42b4091236b5777";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fresca-Regular.ttf $out/share/fonts/truetype/Fresca-Regular.ttf
  '';

  meta = with lib; {
    description = "Fresca";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
