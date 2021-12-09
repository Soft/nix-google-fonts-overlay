{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-extended-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode39extended/LibreBarcode39Extended-Regular.ttf?raw=true";
      name = "LibreBarcode39Extended-Regular.ttf";
      sha256 = "12487148a5cbef847aa4806aa0cb0a88383808125766c2965e96cbf1768f7f64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39Extended-Regular.ttf $out/share/fonts/truetype/LibreBarcode39Extended-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Extended";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
