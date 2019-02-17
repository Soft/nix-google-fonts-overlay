{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mate-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/matesc/MateSC-Regular.ttf?raw=true";
      name = "MateSC-Regular.ttf";
      sha256 = "34b45aaf5e62836b14daef5867aadf3d378e1665f3bfe50e99be20284e1c5875";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MateSC-Regular.ttf $out/share/fonts/truetype/MateSC-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mate SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
