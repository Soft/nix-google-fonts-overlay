{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rancho-${version}";
  version = "2017-08-07-205018";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e4b02c079b076e3437353d51310f866cda2dc865/apache/rancho/Rancho-Regular.ttf?raw=true";
      name = "Rancho-Regular.ttf";
      sha256 = "1add7ee1a98ace8d687935b2a1735e1c53efc8a2108b73c8828db2df8a231306";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rancho-Regular.ttf $out/share/fonts/truetype/Rancho-Regular.ttf
  '';

  meta = with lib; {
    description = "Rancho";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
