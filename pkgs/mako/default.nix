{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mako-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mako/Mako-Regular.ttf?raw=true";
      name = "Mako-Regular.ttf";
      sha256 = "fc000a21aad2f3c7d68369a3f7ac825c897d2191149a9f916f9a936c9fffe91b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mako-Regular.ttf $out/share/fonts/truetype/Mako-Regular.ttf
  '';

  meta = with lib; {
    description = "Mako";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
