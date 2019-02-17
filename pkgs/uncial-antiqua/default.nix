{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "uncial-antiqua-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/uncialantiqua/UncialAntiqua-Regular.ttf?raw=true";
      name = "UncialAntiqua-Regular.ttf";
      sha256 = "33a5128b59d1c95d4f3788164f4ab3a1196f0a982263cb2cd278c47418366766";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UncialAntiqua-Regular.ttf $out/share/fonts/truetype/UncialAntiqua-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Uncial Antiqua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
