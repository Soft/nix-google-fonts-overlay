{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tienne-${version}";
  version = "2017-05-09-191607";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fe506d1bdf3d8b8d043caa01cccc896ee5ff391/ofl/tienne/Tienne-Regular.ttf?raw=true";
      name = "Tienne-Regular.ttf";
      sha256 = "2fa9043583bbe9496744b9e3e1a1d473379c77366357f6bc853c94ad53d8c31c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fe506d1bdf3d8b8d043caa01cccc896ee5ff391/ofl/tienne/Tienne-Bold.ttf?raw=true";
      name = "Tienne-Bold.ttf";
      sha256 = "f9037fef19a075cac703910c3c71ad747addba0aa008fb66d69769f79a41320a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5fe506d1bdf3d8b8d043caa01cccc896ee5ff391/ofl/tienne/Tienne-Black.ttf?raw=true";
      name = "Tienne-Black.ttf";
      sha256 = "491c1dae79c296f300dd18ab595eb8a693a231263bf1a003dc28bd2feac5462a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tienne-Regular.ttf $out/share/fonts/truetype/Tienne-Regular.ttf
     install -Dm644 Tienne-Bold.ttf $out/share/fonts/truetype/Tienne-Bold.ttf
     install -Dm644 Tienne-Black.ttf $out/share/fonts/truetype/Tienne-Black.ttf
  '';

  meta = with lib; {
    description = "Tienne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
