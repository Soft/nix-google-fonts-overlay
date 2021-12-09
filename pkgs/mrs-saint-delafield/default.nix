{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mrs-saint-delafield-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrssaintdelafield/MrsSaintDelafield-Regular.ttf?raw=true";
      name = "MrsSaintDelafield-Regular.ttf";
      sha256 = "67a7abc298ce9d368b2c00fcbff52ec54be948889b8a59032ae80ca3322e5b34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrsSaintDelafield-Regular.ttf $out/share/fonts/truetype/MrsSaintDelafield-Regular.ttf
  '';

  meta = with lib; {
    description = "Mrs Saint Delafield";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
