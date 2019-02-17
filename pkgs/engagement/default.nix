{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "engagement-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/engagement/Engagement-Regular.ttf?raw=true";
      name = "Engagement-Regular.ttf";
      sha256 = "0bfb666005c0f37e9c51265ca5dff812b2fc4929ed324f359caa92f80c25e01a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Engagement-Regular.ttf $out/share/fonts/truetype/Engagement-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Engagement";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
