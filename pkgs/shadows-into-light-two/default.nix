{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shadows-into-light-two-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/shadowsintolighttwo/ShadowsIntoLightTwo-Regular.ttf?raw=true";
      name = "ShadowsIntoLightTwo-Regular.ttf";
      sha256 = "d2540170b1b1df3094de433b4632755ba91ecb65626202a3c8affd2245e08405";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShadowsIntoLightTwo-Regular.ttf $out/share/fonts/truetype/ShadowsIntoLightTwo-Regular.ttf
  '';

  meta = with lib; {
    description = "Shadows Into Light Two";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
