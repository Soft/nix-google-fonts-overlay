{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-text-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode39text/LibreBarcode39Text-Regular.ttf?raw=true";
      name = "LibreBarcode39Text-Regular.ttf";
      sha256 = "fefaf620cf79acd0df929fc02a4298fcc119fd86d01a627583a7b489f3f01086";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39Text-Regular.ttf $out/share/fonts/truetype/LibreBarcode39Text-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
