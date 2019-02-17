{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmex10-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/apache/jsmathcmex10/jsMath-cmex10.ttf?raw=true";
      name = "jsMath-cmex10.ttf";
      sha256 = "bb8880c3992295facd0a1f7e8019039f2e71f939b7d5a32380b711b4e2c0f259";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmex10.ttf $out/share/fonts/truetype/jsMath-cmex10.ttf
  '';

  meta = with stdenv.lib; {
    description = "jsMath cmex10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
