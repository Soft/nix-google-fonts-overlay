{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montaga-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/montaga/Montaga-Regular.ttf?raw=true";
      name = "Montaga-Regular.ttf";
      sha256 = "2f84c4a9ee4921dd629ad55c0003e5f15448737884dea1c3ffd9aacaf3b476a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Montaga-Regular.ttf $out/share/fonts/truetype/Montaga-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Montaga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
