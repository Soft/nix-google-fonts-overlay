{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "literata-${version}";
  version = "2019-01-18-150057";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62dc5cc4728c30fd5bbf7edb5f54364634ad78e7/ofl/literata/Literata-Regular.ttf?raw=true";
      name = "Literata-Regular.ttf";
      sha256 = "ced173ecccff1ff8501401d285ad9a4e2a679b8f21a37cadeabd9c4514d0cc34";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62dc5cc4728c30fd5bbf7edb5f54364634ad78e7/ofl/literata/Literata-Italic.ttf?raw=true";
      name = "Literata-Italic.ttf";
      sha256 = "48fc75d4928d5babcf3a361f0e5c7e95943dd3467e401eb2cfc14a4f34621937";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Literata-Regular.ttf $out/share/fonts/truetype/Literata-Regular.ttf
     install -Dm644 Literata-Italic.ttf $out/share/fonts/truetype/Literata-Italic.ttf
  '';

  meta = with lib; {
    description = "Literata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
