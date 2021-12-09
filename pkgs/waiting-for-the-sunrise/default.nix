{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "waiting-for-the-sunrise-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/waitingforthesunrise/WaitingfortheSunrise.ttf?raw=true";
      name = "WaitingfortheSunrise.ttf";
      sha256 = "ac74e70390f5b1be6927c1e079bd6143821a362550b264c5eb7edde34f0899f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WaitingfortheSunrise.ttf $out/share/fonts/truetype/WaitingfortheSunrise.ttf
  '';

  meta = with lib; {
    description = "Waiting for the Sunrise";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
