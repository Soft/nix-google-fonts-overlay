{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-da-${version}";
  version = "2017-08-07-193437";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7c7b6927ede1d0305dbf503a521ec6dcf4ad6a7d/ofl/balooda/BalooDa-Regular.ttf?raw=true";
      name = "BalooDa-Regular.ttf";
      sha256 = "8a41c01777ff6551c18ce12b4ec23df66d8867062272b57a56a5fdbdd353a9b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooDa-Regular.ttf $out/share/fonts/truetype/BalooDa-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Da";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
