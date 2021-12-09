{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "averia-gruesa-libre-${version}";
  version = "2017-05-08-150243";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e63e802befe8d3730a2c5c9446ddc245c1971082/ofl/averiagruesalibre/AveriaGruesaLibre-Regular.ttf?raw=true";
      name = "AveriaGruesaLibre-Regular.ttf";
      sha256 = "df080c6c99c694b3d741835957e4ebc37d640a9c54f4079ceb8c7211e3f2e209";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AveriaGruesaLibre-Regular.ttf $out/share/fonts/truetype/AveriaGruesaLibre-Regular.ttf
  '';

  meta = with lib; {
    description = "Averia Gruesa Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
