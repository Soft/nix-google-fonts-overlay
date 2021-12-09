{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedgwick-ave-display-${version}";
  version = "2017-08-01-233019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc22e72a35ba7dffa2aab08283c9194f1cee8870/ofl/sedgwickavedisplay/SedgwickAveDisplay-Regular.ttf?raw=true";
      name = "SedgwickAveDisplay-Regular.ttf";
      sha256 = "3b9c295a146bafb93c8a12c1dde38a2fe47512777daf1458825e291752469a38";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SedgwickAveDisplay-Regular.ttf $out/share/fonts/truetype/SedgwickAveDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Sedgwick Ave Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
