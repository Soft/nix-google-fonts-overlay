{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredericka-the-great-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/frederickathegreat/FrederickatheGreat-Regular.ttf?raw=true";
      name = "FrederickatheGreat-Regular.ttf";
      sha256 = "990272dea68d64b9a819554b57e80ceb5276e3df1eaa32ac78190c6232a07132";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FrederickatheGreat-Regular.ttf $out/share/fonts/truetype/FrederickatheGreat-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Fredericka the Great";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
