{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dokdo-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/dokdo/Dokdo-Regular.ttf?raw=true";
      name = "Dokdo-Regular.ttf";
      sha256 = "5b3a3d8d28af31fa9adec3fc5da81a88b52e1ff39ed3930c1db787aa4e79c36d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dokdo-Regular.ttf $out/share/fonts/truetype/Dokdo-Regular.ttf
  '';

  meta = with lib; {
    description = "Dokdo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
