{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-french-canon-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfellfrenchcanonsc/IMFeFCsc28P.ttf?raw=true";
      name = "IMFeFCsc28P.ttf";
      sha256 = "2eeab14e384b07fc27439fb992ba16c77a2996e2227e67e7627ec07c6fd01d9f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeFCsc28P.ttf $out/share/fonts/truetype/IMFeFCsc28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell French Canon SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
