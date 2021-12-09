{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "do-hyeon-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/dohyeon/DoHyeon-Regular.ttf?raw=true";
      name = "DoHyeon-Regular.ttf";
      sha256 = "bd5d5e68572a111d42760082b1c4b299c0bd20373b159c7a200d7d3c829248e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DoHyeon-Regular.ttf $out/share/fonts/truetype/DoHyeon-Regular.ttf
  '';

  meta = with lib; {
    description = "Do Hyeon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
