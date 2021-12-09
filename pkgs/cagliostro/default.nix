{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cagliostro-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/cagliostro/Cagliostro-Regular.ttf?raw=true";
      name = "Cagliostro-Regular.ttf";
      sha256 = "0d205e9a9b34691dca50064ea681404157f1747e39b592fce978b2a32bd5fb61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cagliostro-Regular.ttf $out/share/fonts/truetype/Cagliostro-Regular.ttf
  '';

  meta = with lib; {
    description = "Cagliostro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
