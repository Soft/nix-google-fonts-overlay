{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rhodium-libre-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ecb4c3d48ed676f6204a86a2b378effe477b3677/ofl/rhodiumlibre/RhodiumLibre-Regular.ttf?raw=true";
      name = "RhodiumLibre-Regular.ttf";
      sha256 = "d068be8060fd77135bd7c94ee36822d6902aed3bf0d382d8bcdfcbb5ad1b8283";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RhodiumLibre-Regular.ttf $out/share/fonts/truetype/RhodiumLibre-Regular.ttf
  '';

  meta = with lib; {
    description = "Rhodium Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
