{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gloria-hallelujah-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/gloriahallelujah/GloriaHallelujah.ttf?raw=true";
      name = "GloriaHallelujah.ttf";
      sha256 = "eb59f2762ce8785a292bebb2af3b3e6aa21454913d791f5f25441d1d57ead9fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GloriaHallelujah.ttf $out/share/fonts/truetype/GloriaHallelujah.ttf
  '';

  meta = with lib; {
    description = "Gloria Hallelujah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
