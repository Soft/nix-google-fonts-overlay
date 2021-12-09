{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "limelight-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/limelight/Limelight-Regular.ttf?raw=true";
      name = "Limelight-Regular.ttf";
      sha256 = "f5bf8a9159adfc5b9c756c85d812a4fd1299b8916fefdf39ad4b24ade6d8d0cf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Limelight-Regular.ttf $out/share/fonts/truetype/Limelight-Regular.ttf
  '';

  meta = with lib; {
    description = "Limelight";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
