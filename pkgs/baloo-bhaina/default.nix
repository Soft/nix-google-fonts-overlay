{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaina-${version}";
  version = "2017-08-07-185619";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/127dd8ab0a36263d3a98caa8a11358419bdd53cd/ofl/baloobhaina/BalooBhaina-Regular.ttf?raw=true";
      name = "BalooBhaina-Regular.ttf";
      sha256 = "c80fae67500c90e3d57dacc8320a5ec8846b7e1120427b5e6b8b2b4c45774cbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhaina-Regular.ttf $out/share/fonts/truetype/BalooBhaina-Regular.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhaina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
