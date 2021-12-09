{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "almendra-display-${version}";
  version = "2017-08-07-204752";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0bec64a92bc7a492b7f385297756881602facf91/ofl/almendradisplay/AlmendraDisplay-Regular.ttf?raw=true";
      name = "AlmendraDisplay-Regular.ttf";
      sha256 = "04b543a9e7bfe39262e47d47ae7ec6a04166ce2d05383a911b256cfcb783383f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlmendraDisplay-Regular.ttf $out/share/fonts/truetype/AlmendraDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Almendra Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
