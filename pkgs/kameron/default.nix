{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kameron-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/kameron/Kameron-Regular.ttf?raw=true";
      name = "Kameron-Regular.ttf";
      sha256 = "58ae1aca1002c49e4daee9bf243d58b45846cc574aa46cf05e9700847941aeaa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/kameron/Kameron-Bold.ttf?raw=true";
      name = "Kameron-Bold.ttf";
      sha256 = "817364e5891badba887a0d8346544431d00509d2eb21189800e5de4268a5e9a6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kameron-Regular.ttf $out/share/fonts/truetype/Kameron-Regular.ttf
     install -Dm644 Kameron-Bold.ttf $out/share/fonts/truetype/Kameron-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kameron";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
