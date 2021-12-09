{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kirang-haerang-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/kiranghaerang/KirangHaerang-Regular.ttf?raw=true";
      name = "KirangHaerang-Regular.ttf";
      sha256 = "1bce75bcd68a82db188372fb1919aa9fbb009dabd273353d5020dc60f93e28c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KirangHaerang-Regular.ttf $out/share/fonts/truetype/KirangHaerang-Regular.ttf
  '';

  meta = with lib; {
    description = "Kirang Haerang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
