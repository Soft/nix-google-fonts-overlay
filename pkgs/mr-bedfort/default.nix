{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mr-bedfort-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mrbedfort/MrBedfort-Regular.ttf?raw=true";
      name = "MrBedfort-Regular.ttf";
      sha256 = "1551321151a818cfc5f9f16302e76b8ca86f16bef8fe7478ffeac69211bbdcc9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MrBedfort-Regular.ttf $out/share/fonts/truetype/MrBedfort-Regular.ttf
  '';

  meta = with lib; {
    description = "Mr Bedfort";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
