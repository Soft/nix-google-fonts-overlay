{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruslan-display-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ruslandisplay/RuslanDisplay.ttf?raw=true";
      name = "RuslanDisplay.ttf";
      sha256 = "6d123f70ba14be9997fd6dcc05d5c0b6ea12d6141de35618de7aa6af970bd4c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RuslanDisplay.ttf $out/share/fonts/truetype/RuslanDisplay.ttf
  '';

  meta = with lib; {
    description = "Ruslan Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
