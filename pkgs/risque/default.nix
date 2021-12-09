{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "risque-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/risque/Risque-Regular.ttf?raw=true";
      name = "Risque-Regular.ttf";
      sha256 = "84b3d76741a27e63c66af80c24dee25ed58172751d0fcb3a5f4bd582676bfabd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Risque-Regular.ttf $out/share/fonts/truetype/Risque-Regular.ttf
  '';

  meta = with lib; {
    description = "Risque";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
