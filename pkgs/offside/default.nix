{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "offside-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/offside/Offside-Regular.ttf?raw=true";
      name = "Offside-Regular.ttf";
      sha256 = "55e80cda97b26534ef66e8ec4374602bb73826a938f2c1b8b48476a2b3bd3436";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Offside-Regular.ttf $out/share/fonts/truetype/Offside-Regular.ttf
  '';

  meta = with lib; {
    description = "Offside";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
