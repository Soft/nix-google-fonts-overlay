{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gruppo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gruppo/Gruppo-Regular.ttf?raw=true";
      name = "Gruppo-Regular.ttf";
      sha256 = "2bf89b4b10d8d4a08aec9f6ed124bca48adb10a8bba02d080559195e39dffb80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gruppo-Regular.ttf $out/share/fonts/truetype/Gruppo-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gruppo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
