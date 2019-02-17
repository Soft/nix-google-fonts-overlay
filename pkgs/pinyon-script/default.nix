{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pinyon-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/pinyonscript/PinyonScript-Regular.ttf?raw=true";
      name = "PinyonScript-Regular.ttf";
      sha256 = "26507b30d76ebdd4d2396c068c0ba1aec8c6d162dc10e2f1d21e57c0da0d36d1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PinyonScript-Regular.ttf $out/share/fonts/truetype/PinyonScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pinyon Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
