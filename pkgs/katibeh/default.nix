{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "katibeh-${version}";
  version = "2017-05-23-171559";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/24319bb5f4eb888de54d5b2eefbcefb7f89844b6/ofl/katibeh/Katibeh-Regular.ttf?raw=true";
      name = "Katibeh-Regular.ttf";
      sha256 = "334eeadb58eb442734fe7dea87412cbbd8c3fd00294252723aadf19a850cf11f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Katibeh-Regular.ttf $out/share/fonts/truetype/Katibeh-Regular.ttf
  '';

  meta = with lib; {
    description = "Katibeh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
