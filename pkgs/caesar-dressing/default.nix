{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caesar-dressing-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/caesardressing/CaesarDressing-Regular.ttf?raw=true";
      name = "CaesarDressing-Regular.ttf";
      sha256 = "009dea24a4d4a3a7e02d683087babb1738acc0b949cce38c485fab325c9e9295";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CaesarDressing-Regular.ttf $out/share/fonts/truetype/CaesarDressing-Regular.ttf
  '';

  meta = with lib; {
    description = "Caesar Dressing";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
