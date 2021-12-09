{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antic-didone-${version}";
  version = "2017-08-07-203041";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/64099f31be4ac2bba811398ad84a84d1d70a84fe/ofl/anticdidone/AnticDidone-Regular.ttf?raw=true";
      name = "AnticDidone-Regular.ttf";
      sha256 = "63a560792f0cb5342c0da7759c9df2e1ce0324a8af46ae976d9458fbcccbb440";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnticDidone-Regular.ttf $out/share/fonts/truetype/AnticDidone-Regular.ttf
  '';

  meta = with lib; {
    description = "Antic Didone";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
