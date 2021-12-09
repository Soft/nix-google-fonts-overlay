{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "love-ya-like-a-sister-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/loveyalikeasister/LoveYaLikeASister.ttf?raw=true";
      name = "LoveYaLikeASister.ttf";
      sha256 = "4fbe2c1fa647de5a415acac7b2b6491542fe9767b6199719a3bd77a7cf35eb0d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LoveYaLikeASister.ttf $out/share/fonts/truetype/LoveYaLikeASister.ttf
  '';

  meta = with lib; {
    description = "Love Ya Like A Sister";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
