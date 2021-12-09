{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tangerine-${version}";
  version = "2017-05-09-191318";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c593dd5bbb65fd69c73043371c6d485595e63660/ofl/tangerine/Tangerine-Regular.ttf?raw=true";
      name = "Tangerine-Regular.ttf";
      sha256 = "3f5db6010de48f7173939f16621c0e0e794b589eec04e3b04e0a81be848dfab9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c593dd5bbb65fd69c73043371c6d485595e63660/ofl/tangerine/Tangerine-Bold.ttf?raw=true";
      name = "Tangerine-Bold.ttf";
      sha256 = "a35368c814c71c15928ffc60cbac32bc81461f03b895a4a607df9c64b3d1548b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tangerine-Regular.ttf $out/share/fonts/truetype/Tangerine-Regular.ttf
     install -Dm644 Tangerine-Bold.ttf $out/share/fonts/truetype/Tangerine-Bold.ttf
  '';

  meta = with lib; {
    description = "Tangerine";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
