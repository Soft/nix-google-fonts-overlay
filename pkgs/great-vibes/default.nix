{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "great-vibes-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/greatvibes/GreatVibes-Regular.ttf?raw=true";
      name = "GreatVibes-Regular.ttf";
      sha256 = "9b4de643c541cc8f85b8be33ea93f6131a7911bac9cb44015b49552e402b1b55";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GreatVibes-Regular.ttf $out/share/fonts/truetype/GreatVibes-Regular.ttf
  '';

  meta = with lib; {
    description = "Great Vibes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
