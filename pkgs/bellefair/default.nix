{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bellefair-${version}";
  version = "2017-06-26-171629";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b0aa59ac9fd9d3ff25d5620256fb870ef6ec4128/ofl/bellefair/Bellefair-Regular.ttf?raw=true";
      name = "Bellefair-Regular.ttf";
      sha256 = "5c0cd4d526e6dfcb189106af6b5e6ec99a54efb6d458dfd61626ce6dc0f03026";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bellefair-Regular.ttf $out/share/fonts/truetype/Bellefair-Regular.ttf
  '';

  meta = with lib; {
    description = "Bellefair";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
