{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/leaguescript/LeagueScript.ttf?raw=true";
      name = "LeagueScript.ttf";
      sha256 = "59c5ec3f328710bf5e87e13187747ee0eae046075f347de4e7ea9bdae0ba1a2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LeagueScript.ttf $out/share/fonts/truetype/LeagueScript.ttf
  '';

  meta = with lib; {
    description = "League Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
