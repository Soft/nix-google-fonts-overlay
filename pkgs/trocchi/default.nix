{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trocchi-${version}";
  version = "2016-12-02-173159";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/668ea549d5ac7b771a02e2d0d8cf4e2cfa3b5601/ofl/trocchi/Trocchi-Regular.ttf?raw=true";
      name = "Trocchi-Regular.ttf";
      sha256 = "b1bdf6312239235bef451924f4dde308b6c1a498feb99f0ed25b516222681e1a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Trocchi-Regular.ttf $out/share/fonts/truetype/Trocchi-Regular.ttf
  '';

  meta = with lib; {
    description = "Trocchi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
