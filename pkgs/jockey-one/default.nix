{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jockey-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/jockeyone/JockeyOne-Regular.ttf?raw=true";
      name = "JockeyOne-Regular.ttf";
      sha256 = "6331a3e99e240c45e4b5eb99845f5724932157d6a4766f2b4836f7582891ac4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JockeyOne-Regular.ttf $out/share/fonts/truetype/JockeyOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Jockey One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
