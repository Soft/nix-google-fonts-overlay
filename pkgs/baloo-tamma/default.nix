{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-tamma-${version}";
  version = "2017-08-07-193348";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/da4543935cb2462eeeb754fb8c705c4398ede69e/ofl/balootamma/BalooTamma-Regular.ttf?raw=true";
      name = "BalooTamma-Regular.ttf";
      sha256 = "c6a91827be7e5b1169c2d4eac8c13a280707f7a104893fbeb2029a474e7dd829";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooTamma-Regular.ttf $out/share/fonts/truetype/BalooTamma-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Tamma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
