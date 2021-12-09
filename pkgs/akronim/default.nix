{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akronim-${version}";
  version = "2017-05-01-172028";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/347b8a4d15b618e787fc726898c66bb1dd6c0b02/ofl/akronim/Akronim-Regular.ttf?raw=true";
      name = "Akronim-Regular.ttf";
      sha256 = "b5528ba2b9d60b90cbbe06e587655762dc518616d2613cbdf616751beaf7e2f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Akronim-Regular.ttf $out/share/fonts/truetype/Akronim-Regular.ttf
  '';

  meta = with lib; {
    description = "Akronim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
