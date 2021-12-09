{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedan-sc-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sedansc/SedanSC-Regular.ttf?raw=true";
      name = "SedanSC-Regular.ttf";
      sha256 = "8efd44489b2fa950e84c20e4f40ab6fdb395d301d8b41afa72cdd24920f9cd77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SedanSC-Regular.ttf $out/share/fonts/truetype/SedanSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Sedan SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
