{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "peddana-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/peddana/Peddana-Regular.ttf?raw=true";
      name = "Peddana-Regular.ttf";
      sha256 = "1aca2e50d3a8dd43250bf942049ae18b8fda542f0469434eb35c8a53b1157836";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Peddana-Regular.ttf $out/share/fonts/truetype/Peddana-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Peddana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
