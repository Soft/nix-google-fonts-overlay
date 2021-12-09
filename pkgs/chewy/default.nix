{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chewy-${version}";
  version = "2017-08-07-204502";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/577b1ca8c24482dfa78cfdcf6efc84c5a427ef15/apache/chewy/Chewy-Regular.ttf?raw=true";
      name = "Chewy-Regular.ttf";
      sha256 = "7cf75ea288f82fd20badea8ab4da7a656a96a7277c170811e813b3d3d6294147";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chewy-Regular.ttf $out/share/fonts/truetype/Chewy-Regular.ttf
  '';

  meta = with lib; {
    description = "Chewy";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
