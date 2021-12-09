{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cute-font-${version}";
  version = "2018-03-13-164329";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16680f8688ffcd467d2eb2146a9ce0343404581d/ofl/cutefont/CuteFont-Regular.ttf?raw=true";
      name = "CuteFont-Regular.ttf";
      sha256 = "c403227fe6288a8c1423ca48e93fd7efc81e3b81053f7d17adcf659bd95fa4c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CuteFont-Regular.ttf $out/share/fonts/truetype/CuteFont-Regular.ttf
  '';

  meta = with lib; {
    description = "Cute Font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
