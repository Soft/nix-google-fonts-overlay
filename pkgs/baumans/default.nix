{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baumans-${version}";
  version = "2017-08-07-195559";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/75a4258500cb76408c404142da0d70557c07d879/ofl/baumans/Baumans-Regular.ttf?raw=true";
      name = "Baumans-Regular.ttf";
      sha256 = "fc224bf301c1c9204ab89fff5a8962472aea25af01a20223d8fe2aa69d06d6b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Baumans-Regular.ttf $out/share/fonts/truetype/Baumans-Regular.ttf
  '';

  meta = with lib; {
    description = "Baumans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
