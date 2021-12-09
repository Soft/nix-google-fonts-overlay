{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oranienbaum-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bacec3651f66c2e219e20a9a0d0aa0286c74a777/ofl/oranienbaum/Oranienbaum-Regular.ttf?raw=true";
      name = "Oranienbaum-Regular.ttf";
      sha256 = "d0c2527f106ddaf53bebce08e903b585d1fd1d830eddd23ed723c313b4fe2c6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Oranienbaum-Regular.ttf $out/share/fonts/truetype/Oranienbaum-Regular.ttf
  '';

  meta = with lib; {
    description = "Oranienbaum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
