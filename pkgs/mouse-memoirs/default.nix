{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mouse-memoirs-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mousememoirs/MouseMemoirs-Regular.ttf?raw=true";
      name = "MouseMemoirs-Regular.ttf";
      sha256 = "1bb7f4baccb46375c5692327af8313fdc242b9e6a584d43c637357a3de998834";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MouseMemoirs-Regular.ttf $out/share/fonts/truetype/MouseMemoirs-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mouse Memoirs";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
