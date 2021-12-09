{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tenor-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/tenorsans/TenorSans-Regular.ttf?raw=true";
      name = "TenorSans-Regular.ttf";
      sha256 = "350c882fa9f19927ed108371691d393d5dc1c209edde8472cab8aa8013241366";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TenorSans-Regular.ttf $out/share/fonts/truetype/TenorSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Tenor Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
