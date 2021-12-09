{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bevan-${version}";
  version = "2016-12-02-172256";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd2f45e45a6cbc520fa1c2a8b9e0358e95e73ff1/ofl/bevan/Bevan-Regular.ttf?raw=true";
      name = "Bevan-Regular.ttf";
      sha256 = "11a453725d9873c87fde5f4dad000f20eeed38b7e265f60152093e32863a36a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bevan-Regular.ttf $out/share/fonts/truetype/Bevan-Regular.ttf
  '';

  meta = with lib; {
    description = "Bevan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
