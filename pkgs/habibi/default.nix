{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "habibi-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/habibi/Habibi-Regular.ttf?raw=true";
      name = "Habibi-Regular.ttf";
      sha256 = "65ae905bf98ae8ca0ec67786d01cdc1add55759dbb8b99e7da0d368f9ea74671";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Habibi-Regular.ttf $out/share/fonts/truetype/Habibi-Regular.ttf
  '';

  meta = with lib; {
    description = "Habibi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
