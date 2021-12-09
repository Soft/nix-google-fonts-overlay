{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-french-canon-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfellfrenchcanon/IMFeFCrm28P.ttf?raw=true";
      name = "IMFeFCrm28P.ttf";
      sha256 = "3fea76932a62ff94ff93f1cf95b338330674df8ecd16e961116a346a64900dd3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/imfellfrenchcanon/IMFeFCit28P.ttf?raw=true";
      name = "IMFeFCit28P.ttf";
      sha256 = "c52e1ec27251b4cd6663e38415380404ecf39b2ceeb5535d40598590a511e459";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeFCrm28P.ttf $out/share/fonts/truetype/IMFeFCrm28P.ttf
     install -Dm644 IMFeFCit28P.ttf $out/share/fonts/truetype/IMFeFCit28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell French Canon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
