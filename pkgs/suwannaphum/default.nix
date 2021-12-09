{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suwannaphum-${version}";
  version = "2017-08-07-182453";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5abff8af83cdb69b21da67b746570be99f34ab39/ofl/suwannaphum/Suwannaphum-Regular.ttf?raw=true";
      name = "Suwannaphum-Regular.ttf";
      sha256 = "caa71da4d81bc121577fbbc15c3f61ae62de49c6e85ce235dab561347551e6bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Suwannaphum-Regular.ttf $out/share/fonts/truetype/Suwannaphum-Regular.ttf
  '';

  meta = with lib; {
    description = "Suwannaphum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
