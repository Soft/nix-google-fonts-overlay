{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lateef-${version}";
  version = "2018-07-09-203917";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lateef/LateefRegOT.ttf?raw=true";
      name = "LateefRegOT.ttf";
      sha256 = "864ebe4b24bee6c88cb02a6169830b51b786a59a7b395fe5beccaf9f2c3f19c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LateefRegOT.ttf $out/share/fonts/truetype/LateefRegOT.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lateef";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
