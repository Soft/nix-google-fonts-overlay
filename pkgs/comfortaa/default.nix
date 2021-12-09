{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comfortaa-${version}";
  version = "2018-12-05-144320";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/387b20862f999325568739bd2a5700b3d10672cf/ofl/comfortaa/Comfortaa-Regular.ttf?raw=true";
      name = "Comfortaa-Regular.ttf";
      sha256 = "6c18f166c93e0aae3879a45f442b7024f726517768ef22edcbfdbcb0f56a331d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Comfortaa-Regular.ttf $out/share/fonts/truetype/Comfortaa-Regular.ttf
  '';

  meta = with lib; {
    description = "Comfortaa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
