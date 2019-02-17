{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-${version}";
  version = "2017-09-27-040229";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c49a299a759485b9b2cb67b1d964b44e3a6b09/ofl/librebarcode128/LibreBarcode128-Regular.ttf?raw=true";
      name = "LibreBarcode128-Regular.ttf";
      sha256 = "29ed1e17cc6e5338dfb4546aec02bec22d997cb20a00162c5ba6f745eee0c071";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode128-Regular.ttf $out/share/fonts/truetype/LibreBarcode128-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Libre Barcode 128";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
