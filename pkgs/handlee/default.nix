{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "handlee-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/handlee/Handlee-Regular.ttf?raw=true";
      name = "Handlee-Regular.ttf";
      sha256 = "7b99c0f291b5d52e06c66498a1d0dd6dff45a32e32d13be089c60d2d8dc00445";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Handlee-Regular.ttf $out/share/fonts/truetype/Handlee-Regular.ttf
  '';

  meta = with lib; {
    description = "Handlee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
