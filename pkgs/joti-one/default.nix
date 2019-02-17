{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "joti-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/jotione/JotiOne-Regular.ttf?raw=true";
      name = "JotiOne-Regular.ttf";
      sha256 = "6d31399c9aca62e6bf47d7f2949e1a77249500ba0157037346bd61ddb5bcbf00";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JotiOne-Regular.ttf $out/share/fonts/truetype/JotiOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Joti One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
