{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sunshiney-${version}";
  version = "2017-08-07-205619";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/15cb31c6e701c9a8b3c58835804bb5e3fd9d3160/apache/sunshiney/Sunshiney-Regular.ttf?raw=true";
      name = "Sunshiney-Regular.ttf";
      sha256 = "2f41cbc6263c033c18f1db7ae6523a89eb50cd5665b0b7635cc3a4c9c9a0fe4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sunshiney-Regular.ttf $out/share/fonts/truetype/Sunshiney-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sunshiney";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
