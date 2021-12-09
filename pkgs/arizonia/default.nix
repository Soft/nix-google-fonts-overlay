{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arizonia-${version}";
  version = "2017-08-07-201037";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/40407d6486ca43f18135d70e292aa319e5f23b71/ofl/arizonia/Arizonia-Regular.ttf?raw=true";
      name = "Arizonia-Regular.ttf";
      sha256 = "88a0b799ca4a531698c1f14319ee8703b4bbfcba055a5981db7342d1e3ba028e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arizonia-Regular.ttf $out/share/fonts/truetype/Arizonia-Regular.ttf
  '';

  meta = with lib; {
    description = "Arizonia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
