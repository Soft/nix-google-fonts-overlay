{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shadows-into-light-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/shadowsintolight/ShadowsIntoLight.ttf?raw=true";
      name = "ShadowsIntoLight.ttf";
      sha256 = "1347863151acdc00fa281daaba1a3543dbce5870b55f9cf7479a15bb84007681";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShadowsIntoLight.ttf $out/share/fonts/truetype/ShadowsIntoLight.ttf
  '';

  meta = with lib; {
    description = "Shadows Into Light";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
