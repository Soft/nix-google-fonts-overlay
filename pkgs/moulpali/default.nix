{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moulpali-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/moulpali/Moulpali.ttf?raw=true";
      name = "Moulpali.ttf";
      sha256 = "729290c19670f6d26570420271dbc8b7e39be540b30e3a27fc7fd09b65d841f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moulpali.ttf $out/share/fonts/truetype/Moulpali.ttf
  '';

  meta = with lib; {
    description = "Moulpali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
