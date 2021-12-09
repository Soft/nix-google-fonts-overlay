{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gravitas-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gravitasone/GravitasOne.ttf?raw=true";
      name = "GravitasOne.ttf";
      sha256 = "b40dc45f3354f282107286acf1542072d258c717c8edf1d118ef0105f25e627b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GravitasOne.ttf $out/share/fonts/truetype/GravitasOne.ttf
  '';

  meta = with lib; {
    description = "Gravitas One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
