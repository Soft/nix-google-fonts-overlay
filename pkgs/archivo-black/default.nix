{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "archivo-black-${version}";
  version = "2017-08-07-210725";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e723d317895c9dd66f7f87012577bab2c0ea6b5d/ofl/archivoblack/ArchivoBlack-Regular.ttf?raw=true";
      name = "ArchivoBlack-Regular.ttf";
      sha256 = "dd9a89a019b4849f66ab75455fe7bdf931311042cbb0f0f97acc061539703180";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArchivoBlack-Regular.ttf $out/share/fonts/truetype/ArchivoBlack-Regular.ttf
  '';

  meta = with lib; {
    description = "Archivo Black";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
