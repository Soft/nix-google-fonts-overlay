{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mate-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mate/Mate-Regular.ttf?raw=true";
      name = "Mate-Regular.ttf";
      sha256 = "4e4360a59949fb48f8bf4b52cecca3cde736138bffd9908c43a1e9d5163acc25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mate/Mate-Italic.ttf?raw=true";
      name = "Mate-Italic.ttf";
      sha256 = "3784df9d29ef28fde3635d2f9d6af842b9cdfae9aa957f99bd65c9620b6950d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mate-Regular.ttf $out/share/fonts/truetype/Mate-Regular.ttf
     install -Dm644 Mate-Italic.ttf $out/share/fonts/truetype/Mate-Italic.ttf
  '';

  meta = with lib; {
    description = "Mate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
