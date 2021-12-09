{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kumar-one-${version}";
  version = "2017-05-23-165014";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/06463af090c89d08dd94f6d64c7458cd073ee700/ofl/kumarone/KumarOne-Regular.ttf?raw=true";
      name = "KumarOne-Regular.ttf";
      sha256 = "04d6479721639f0d00aa34cfaa18d940eacf84060b427433edb70100b6d01100";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KumarOne-Regular.ttf $out/share/fonts/truetype/KumarOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Kumar One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
