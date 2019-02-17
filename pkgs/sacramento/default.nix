{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sacramento-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sacramento/Sacramento-Regular.ttf?raw=true";
      name = "Sacramento-Regular.ttf";
      sha256 = "9341fda10adbfeb7efc94302b34507a3e227d7e7f5c432df3f5ac8753ff73d24";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sacramento-Regular.ttf $out/share/fonts/truetype/Sacramento-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sacramento";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
