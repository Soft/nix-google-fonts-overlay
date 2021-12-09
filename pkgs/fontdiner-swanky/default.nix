{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fontdiner-swanky-${version}";
  version = "2017-08-07-204438";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c9bc5498a323be2c3ca18459fef1bacf6abd5359/apache/fontdinerswanky/FontdinerSwanky-Regular.ttf?raw=true";
      name = "FontdinerSwanky-Regular.ttf";
      sha256 = "847229fbf58c7f7479f93fd7cf9fc269b54c0c9f6465abcb65a206fb261be41b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FontdinerSwanky-Regular.ttf $out/share/fonts/truetype/FontdinerSwanky-Regular.ttf
  '';

  meta = with lib; {
    description = "Fontdiner Swanky";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
