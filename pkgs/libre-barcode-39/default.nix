{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode39/LibreBarcode39-Regular.ttf?raw=true";
      name = "LibreBarcode39-Regular.ttf";
      sha256 = "8a21f4fd7d38895a88db494acd8a21524d5502b6636e6e4c1d8951a3d3e2968f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39-Regular.ttf $out/share/fonts/truetype/LibreBarcode39-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
