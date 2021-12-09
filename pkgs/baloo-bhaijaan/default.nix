{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaijaan-${version}";
  version = "2017-08-07-185558";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfbc84b546c07a2459d713c517e612ba9151b692/ofl/baloobhaijaan/BalooBhaijaan-Regular.ttf?raw=true";
      name = "BalooBhaijaan-Regular.ttf";
      sha256 = "6c004f2d2ad39444e8337aeef39fffbd3032f7282f8cc9062d7b40ab3dbb1e80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhaijaan-Regular.ttf $out/share/fonts/truetype/BalooBhaijaan-Regular.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhaijaan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
