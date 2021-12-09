{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atomic-age-${version}";
  version = "2017-08-07-200036";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8927638111f459d395b287bbef67b78a9fd86ca6/ofl/atomicage/AtomicAge-Regular.ttf?raw=true";
      name = "AtomicAge-Regular.ttf";
      sha256 = "5ea6111180af882b0799a1e1c04b7acc557807ff76e0cc24258b259a06f67ed2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AtomicAge-Regular.ttf $out/share/fonts/truetype/AtomicAge-Regular.ttf
  '';

  meta = with lib; {
    description = "Atomic Age";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
