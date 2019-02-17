{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geostar-fill-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/geostarfill/GeostarFill-Regular.ttf?raw=true";
      name = "GeostarFill-Regular.ttf";
      sha256 = "f09acdc20fa02f320e97046f618cb5e424d12d97a19d4746f05ea15371de12a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GeostarFill-Regular.ttf $out/share/fonts/truetype/GeostarFill-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Geostar Fill";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
