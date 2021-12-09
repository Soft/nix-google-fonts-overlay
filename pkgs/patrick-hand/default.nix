{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patrick-hand-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/patrickhand/PatrickHand-Regular.ttf?raw=true";
      name = "PatrickHand-Regular.ttf";
      sha256 = "0f173b3e6cb6d1af25babf7f0057c5ac4ee11f9992b0469bb817e967ef4ad0fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatrickHand-Regular.ttf $out/share/fonts/truetype/PatrickHand-Regular.ttf
  '';

  meta = with lib; {
    description = "Patrick Hand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
