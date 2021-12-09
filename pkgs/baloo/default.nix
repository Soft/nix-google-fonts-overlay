{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-${version}";
  version = "2017-08-07-185002";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/70de3e339f1025b2407ba06bb66ddbe3c91548fa/ofl/baloo/Baloo-Regular.ttf?raw=true";
      name = "Baloo-Regular.ttf";
      sha256 = "119dd368dbfa6e79dcfdc3f84047e313cef8565846d9cff28354310ae7f29827";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Baloo-Regular.ttf $out/share/fonts/truetype/Baloo-Regular.ttf
  '';

  meta = with lib; {
    description = "Baloo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
