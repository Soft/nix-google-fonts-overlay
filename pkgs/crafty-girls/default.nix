{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crafty-girls-${version}";
  version = "2017-08-07-204446";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/98e76702ed5605fca661a75a3880f5a5424904ab/apache/craftygirls/CraftyGirls-Regular.ttf?raw=true";
      name = "CraftyGirls-Regular.ttf";
      sha256 = "5f92fed441fc72e75fd520ee63b4785c9b657404c53e1f269c95a6016298ef45";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CraftyGirls-Regular.ttf $out/share/fonts/truetype/CraftyGirls-Regular.ttf
  '';

  meta = with lib; {
    description = "Crafty Girls";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
