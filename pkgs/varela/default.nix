{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varela-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/varela/Varela-Regular.ttf?raw=true";
      name = "Varela-Regular.ttf";
      sha256 = "87cf0ddd50cd297cd6facfaac8bf59bf8d0b1a3b8b6619957ba08e72043d1896";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Varela-Regular.ttf $out/share/fonts/truetype/Varela-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Varela";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
