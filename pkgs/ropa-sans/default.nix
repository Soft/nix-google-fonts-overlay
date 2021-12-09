{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ropa-sans-${version}";
  version = "2016-12-02-171757";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e97aa3a8df0d2bd12b5a686205619fa1f2600ab/ofl/ropasans/RopaSans-Regular.ttf?raw=true";
      name = "RopaSans-Regular.ttf";
      sha256 = "4a0bc3429f672cab4f9ad5e58047d9e7ccb6ad16db155ab92c56d1aefcdda8f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e97aa3a8df0d2bd12b5a686205619fa1f2600ab/ofl/ropasans/RopaSans-Italic.ttf?raw=true";
      name = "RopaSans-Italic.ttf";
      sha256 = "c7a8d38df247c21fb55ee452619b1ae5c452771c501972dbd317a0f07ca1706d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RopaSans-Regular.ttf $out/share/fonts/truetype/RopaSans-Regular.ttf
     install -Dm644 RopaSans-Italic.ttf $out/share/fonts/truetype/RopaSans-Italic.ttf
  '';

  meta = with lib; {
    description = "Ropa Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
