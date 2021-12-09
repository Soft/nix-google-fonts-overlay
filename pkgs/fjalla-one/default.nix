{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fjalla-one-${version}";
  version = "2017-10-15-213557";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/fjallaone/FjallaOne-Regular.ttf?raw=true";
      name = "FjallaOne-Regular.ttf";
      sha256 = "8b67075f4791c35b8cd889b3089d0d8dcb0f7813cdfbdb4ff1a9871304602a7f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FjallaOne-Regular.ttf $out/share/fonts/truetype/FjallaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fjalla One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
