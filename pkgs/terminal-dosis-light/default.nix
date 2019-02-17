{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "terminal-dosis-light-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/terminaldosislight/TerminalDosis-Light.ttf?raw=true";
      name = "TerminalDosis-Light.ttf";
      sha256 = "9e730de1855cdbed5ef65fa30c388739eb3f44da3b063f02ba0ac988b135fece";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TerminalDosis-Light.ttf $out/share/fonts/truetype/TerminalDosis-Light.ttf
  '';

  meta = with stdenv.lib; {
    description = "Terminal Dosis Light";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
