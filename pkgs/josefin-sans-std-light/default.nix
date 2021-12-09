{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-sans-std-light-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/josefinsansstdlight/JosefinSansStd-Light.ttf?raw=true";
      name = "JosefinSansStd-Light.ttf";
      sha256 = "5df2ef2663215f7a3755e98d108bc3715f88e6df56fc9a3d423d430a76ab0b76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSansStd-Light.ttf $out/share/fonts/truetype/JosefinSansStd-Light.ttf
  '';

  meta = with lib; {
    description = "Josefin Sans Std Light";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
