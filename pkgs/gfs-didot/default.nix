{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gfs-didot-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gfsdidot/GFSDidot-Regular.ttf?raw=true";
      name = "GFSDidot-Regular.ttf";
      sha256 = "4fc784ab824e8866eeef8ad55976b93e7e170fb1b8237fd4f8781b5b4dd297f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GFSDidot-Regular.ttf $out/share/fonts/truetype/GFSDidot-Regular.ttf
  '';

  meta = with lib; {
    description = "GFS Didot";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
