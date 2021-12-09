{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "strait-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/strait/Strait-Regular.ttf?raw=true";
      name = "Strait-Regular.ttf";
      sha256 = "648f84d4c594ee1c857ed52f28da94d33539dfdcc2fb03d4c1ca0af4b9e01c0e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Strait-Regular.ttf $out/share/fonts/truetype/Strait-Regular.ttf
  '';

  meta = with lib; {
    description = "Strait";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
