{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-extended-text-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode39extendedtext/LibreBarcode39ExtendedText-Regular.ttf?raw=true";
      name = "LibreBarcode39ExtendedText-Regular.ttf";
      sha256 = "c80e3e0dd00bb80cff9024c90735f264201bbf9b658219a9eac9417c2994ad5f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39ExtendedText-Regular.ttf $out/share/fonts/truetype/LibreBarcode39ExtendedText-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Libre Barcode 39 Extended Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
