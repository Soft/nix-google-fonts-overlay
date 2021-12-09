{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "adamina-${version}";
  version = "2017-05-01-172020";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/baf1d1a971ba7f1fbb0d3211a63ffd0525597c21/ofl/adamina/Adamina-Regular.ttf?raw=true";
      name = "Adamina-Regular.ttf";
      sha256 = "e7108cfee0a718d5885fc8d0f03555fa6e0c4b6309e4b15ea991aadd824c34b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Adamina-Regular.ttf $out/share/fonts/truetype/Adamina-Regular.ttf
  '';

  meta = with lib; {
    description = "Adamina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
