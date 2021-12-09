{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "brawler-${version}";
  version = "2017-08-07-200916";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3b44dd64081bb2d9d295200974ea5e603a4b1c7e/ofl/brawler/Brawler-Regular.ttf?raw=true";
      name = "Brawler-Regular.ttf";
      sha256 = "741f2c0a780937a9a4eed1c0d2fee0989ee987694f9923117be598fdbdde301c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Brawler-Regular.ttf $out/share/fonts/truetype/Brawler-Regular.ttf
  '';

  meta = with lib; {
    description = "Brawler";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
