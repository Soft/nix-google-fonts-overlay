{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "denk-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/denkone/DenkOne-Regular.ttf?raw=true";
      name = "DenkOne-Regular.ttf";
      sha256 = "0d2efbe8916c14f7ce30afed5cd09a503fd6b3b1498bfaad436ee47d3bde8ec0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DenkOne-Regular.ttf $out/share/fonts/truetype/DenkOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Denk One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
