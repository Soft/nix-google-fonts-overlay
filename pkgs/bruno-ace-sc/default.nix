{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bruno-ace-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/brunoacesc/BrunoAceSC-Regular.ttf?raw=true";
      name = "BrunoAceSC-Regular.ttf";
      sha256 = "a5f0981615408597b4cc48d19c51d68806af2e831cdc0b1d589c7c58828743b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BrunoAceSC-Regular.ttf $out/share/fonts/truetype/BrunoAceSC-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bruno Ace SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
