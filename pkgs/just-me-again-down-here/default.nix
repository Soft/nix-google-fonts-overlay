{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "just-me-again-down-here-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/justmeagaindownhere/JustMeAgainDownHere.ttf?raw=true";
      name = "JustMeAgainDownHere.ttf";
      sha256 = "0412aa1e460666d339738991b48e9f4bd51e10b6f04e2e1341fce4d2b3244c31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JustMeAgainDownHere.ttf $out/share/fonts/truetype/JustMeAgainDownHere.ttf
  '';

  meta = with lib; {
    description = "Just Me Again Down Here";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
