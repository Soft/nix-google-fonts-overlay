{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mr-de-haviland-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrdehaviland/MrDeHaviland-Regular.ttf?raw=true";
      name = "MrDeHaviland-Regular.ttf";
      sha256 = "10cd8e34b17a42722dc49d2d62b7fe774595abe34cc89ee1d79663df68ea6089";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrDeHaviland-Regular.ttf $out/share/fonts/truetype/MrDeHaviland-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mr De Haviland";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
