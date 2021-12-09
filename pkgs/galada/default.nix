{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galada-${version}";
  version = "2017-08-07-200506";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a98b83a29a5bb99796787f4557cb35c6c419f8bd/ofl/galada/Galada-Regular.ttf?raw=true";
      name = "Galada-Regular.ttf";
      sha256 = "acc22b41ee470dc542e15b5f8907c7fbebef1b9c01eb20e4127bdbf052b006ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Galada-Regular.ttf $out/share/fonts/truetype/Galada-Regular.ttf
  '';

  meta = with lib; {
    description = "Galada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
