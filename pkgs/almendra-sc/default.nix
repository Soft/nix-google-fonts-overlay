{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "almendra-sc-${version}";
  version = "2017-08-07-204718";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c5730ef6c912f2466b8f57ea937c4e8c94e7d745/ofl/almendrasc/AlmendraSC-Regular.ttf?raw=true";
      name = "AlmendraSC-Regular.ttf";
      sha256 = "dca733b5b03e4ea52c666365777c8f6b360d55de04efc9d834cf9f82b68308be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlmendraSC-Regular.ttf $out/share/fonts/truetype/AlmendraSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Almendra SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
