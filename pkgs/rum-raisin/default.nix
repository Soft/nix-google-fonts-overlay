{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rum-raisin-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/rumraisin/RumRaisin-Regular.ttf?raw=true";
      name = "RumRaisin-Regular.ttf";
      sha256 = "1fb741013c05995ea48aab1c16bcd141c004ea5c8f9466df9a0e1317d057412e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RumRaisin-Regular.ttf $out/share/fonts/truetype/RumRaisin-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rum Raisin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
