{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arapey-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f106b928fdac618499612cfcacb962341598f588/ofl/arapey/Arapey-Regular.ttf?raw=true";
      name = "Arapey-Regular.ttf";
      sha256 = "5da4525899a27708241a4108e76d6bfd087766a66d159d80dcf986801bfb1092";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f106b928fdac618499612cfcacb962341598f588/ofl/arapey/Arapey-Italic.ttf?raw=true";
      name = "Arapey-Italic.ttf";
      sha256 = "3053e62a5bf1fe0f08d8196bf31de312def7dea7b0415d6b20385caa5d333b0a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arapey-Regular.ttf $out/share/fonts/truetype/Arapey-Regular.ttf
     install -Dm644 Arapey-Italic.ttf $out/share/fonts/truetype/Arapey-Italic.ttf
  '';

  meta = with lib; {
    description = "Arapey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
