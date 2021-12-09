{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sumana-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f6df8a04beec750a0e86da19d10674d9703dd969/ofl/sumana/Sumana-Regular.ttf?raw=true";
      name = "Sumana-Regular.ttf";
      sha256 = "e71be1be55f8970ef24ee3aaf790c34cad3f5b6c5d518e41c8651c596e102ec4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f6df8a04beec750a0e86da19d10674d9703dd969/ofl/sumana/Sumana-Bold.ttf?raw=true";
      name = "Sumana-Bold.ttf";
      sha256 = "e32150c36ced10804d077dc41714df7e5c8471408bccc7036fba30314a914e79";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sumana-Regular.ttf $out/share/fonts/truetype/Sumana-Regular.ttf
     install -Dm644 Sumana-Bold.ttf $out/share/fonts/truetype/Sumana-Bold.ttf
  '';

  meta = with lib; {
    description = "Sumana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
