{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "raleway-dots-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ralewaydots/RalewayDots-Regular.ttf?raw=true";
      name = "RalewayDots-Regular.ttf";
      sha256 = "cd3956043e1ee880bdf1670b7d0720bf25def80453528127d03332811c45e486";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RalewayDots-Regular.ttf $out/share/fonts/truetype/RalewayDots-Regular.ttf
  '';

  meta = with lib; {
    description = "Raleway Dots";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
