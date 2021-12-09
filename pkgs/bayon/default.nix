{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bayon-${version}";
  version = "2017-08-07-193939";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/557f51e77b5f71a0d163f5a1565890e25b527e73/ofl/bayon/Bayon-Regular.ttf?raw=true";
      name = "Bayon-Regular.ttf";
      sha256 = "e4d00d4e8ddc9f0b79601c4855e90548ff1b1efca57c39655b3676239fc819d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bayon-Regular.ttf $out/share/fonts/truetype/Bayon-Regular.ttf
  '';

  meta = with lib; {
    description = "Bayon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
