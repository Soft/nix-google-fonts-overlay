{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pavanam-${version}";
  version = "2017-05-23-171413";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ca92cf496b7d3076b67013505532bb13557543b2/ofl/pavanam/Pavanam-Regular.ttf?raw=true";
      name = "Pavanam-Regular.ttf";
      sha256 = "d2805bfdca57f7d7a0c69edf35a5f98d4605af6603dcca943db5d11ea531c2f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pavanam-Regular.ttf $out/share/fonts/truetype/Pavanam-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pavanam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
