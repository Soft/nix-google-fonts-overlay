{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmr10-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/jsmathcmr10/jsMath-cmr10.ttf?raw=true";
      name = "jsMath-cmr10.ttf";
      sha256 = "9bd5bae936a4af7152f320e3fee7f14ebbb778101903e9c8b2cc8901f40b778b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmr10.ttf $out/share/fonts/truetype/jsMath-cmr10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmr10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
