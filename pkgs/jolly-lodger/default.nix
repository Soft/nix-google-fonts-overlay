{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jolly-lodger-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/jollylodger/JollyLodger-Regular.ttf?raw=true";
      name = "JollyLodger-Regular.ttf";
      sha256 = "64d3e628ae2f3ebcb34eed029e90cb6674e9e74ed4e76e72effbf53b93b2dbf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JollyLodger-Regular.ttf $out/share/fonts/truetype/JollyLodger-Regular.ttf
  '';

  meta = with lib; {
    description = "Jolly Lodger";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
