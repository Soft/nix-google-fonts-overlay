{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "harmattan-${version}";
  version = "2017-05-23-164619";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/babc03259b61b146e68545a974a0b6f85c22d095/ofl/harmattan/Harmattan-Regular.ttf?raw=true";
      name = "Harmattan-Regular.ttf";
      sha256 = "dcb520580ac5ce170d88e1959c6d216f08f1ca5e41a35c5357d4555c04248371";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Harmattan-Regular.ttf $out/share/fonts/truetype/Harmattan-Regular.ttf
  '';

  meta = with lib; {
    description = "Harmattan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
