{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bahiana-${version}";
  version = "2016-12-03-215315";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f4557a57c5b09516a6b26c9f13fe28fa13df79f/ofl/bahiana/Bahiana-Regular.ttf?raw=true";
      name = "Bahiana-Regular.ttf";
      sha256 = "75760e955339cd70012c8bd9577d373f8bdd4256a73f571f61a42f58ea26fe9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bahiana-Regular.ttf $out/share/fonts/truetype/Bahiana-Regular.ttf
  '';

  meta = with lib; {
    description = "Bahiana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
