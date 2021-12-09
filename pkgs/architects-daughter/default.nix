{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "architects-daughter-${version}";
  version = "2017-08-07-202956";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2a0c94b33e35d8fca983a4e50efdf7de50019ce2/ofl/architectsdaughter/ArchitectsDaughter-Regular.ttf?raw=true";
      name = "ArchitectsDaughter-Regular.ttf";
      sha256 = "6159718a08898e34bc1cb7354086141a5f9a70b73e54dbec27ead0d59a697359";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArchitectsDaughter-Regular.ttf $out/share/fonts/truetype/ArchitectsDaughter-Regular.ttf
  '';

  meta = with lib; {
    description = "Architects Daughter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
