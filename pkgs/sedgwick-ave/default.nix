{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedgwick-ave-${version}";
  version = "2017-08-01-233019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc22e72a35ba7dffa2aab08283c9194f1cee8870/ofl/sedgwickave/SedgwickAve-Regular.ttf?raw=true";
      name = "SedgwickAve-Regular.ttf";
      sha256 = "9c3633e56a8a104e0d10debb70907b66bb3cf32b03137fae7d5392712b253efa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SedgwickAve-Regular.ttf $out/share/fonts/truetype/SedgwickAve-Regular.ttf
  '';

  meta = with lib; {
    description = "Sedgwick Ave";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
