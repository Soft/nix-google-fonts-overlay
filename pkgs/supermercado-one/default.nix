{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "supermercado-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/supermercadoone/SupermercadoOne-Regular.ttf?raw=true";
      name = "SupermercadoOne-Regular.ttf";
      sha256 = "73e1f6c46e4f94949df8394a5dc207a5ae4c75b94d19b012c7b8eaa67dca3750";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SupermercadoOne-Regular.ttf $out/share/fonts/truetype/SupermercadoOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Supermercado One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
