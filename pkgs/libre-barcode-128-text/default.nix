{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-text-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode128text/LibreBarcode128Text-Regular.ttf?raw=true";
      name = "LibreBarcode128Text-Regular.ttf";
      sha256 = "fb7da17334ac4b91b5c3ed09698306887fbed5d801d5ac8962274c07b259654c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode128Text-Regular.ttf $out/share/fonts/truetype/LibreBarcode128Text-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 128 Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
