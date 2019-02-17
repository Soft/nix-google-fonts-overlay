{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "titan-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/titanone/TitanOne-Regular.ttf?raw=true";
      name = "TitanOne-Regular.ttf";
      sha256 = "563ff6de179bbd44bcd7d2a6c448d6dc3bf935834237cf1250e506e65cd86ff1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TitanOne-Regular.ttf $out/share/fonts/truetype/TitanOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Titan One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
