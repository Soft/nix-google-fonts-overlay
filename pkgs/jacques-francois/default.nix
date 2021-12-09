{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacques-francois-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/jacquesfrancois/JacquesFrancois-Regular.ttf?raw=true";
      name = "JacquesFrancois-Regular.ttf";
      sha256 = "33aa3d742ee62f235016dd63f7e1ed6a3450e0d527a0e951bb1d410a47ac68cd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JacquesFrancois-Regular.ttf $out/share/fonts/truetype/JacquesFrancois-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacques Francois";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
