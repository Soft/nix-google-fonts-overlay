{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "henny-penny-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/hennypenny/HennyPenny-Regular.ttf?raw=true";
      name = "HennyPenny-Regular.ttf";
      sha256 = "9c8550665827dbd341e5d54ea2e686fa4f4a9de3f8b2ed202b96a41e27ab4e19";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HennyPenny-Regular.ttf $out/share/fonts/truetype/HennyPenny-Regular.ttf
  '';

  meta = with lib; {
    description = "Henny Penny";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
