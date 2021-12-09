{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "delius-swash-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/deliusswashcaps/DeliusSwashCaps-Regular.ttf?raw=true";
      name = "DeliusSwashCaps-Regular.ttf";
      sha256 = "04c102448007265b8a0672590900919d35dfd26c624e543c8c3bfbab9535b642";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DeliusSwashCaps-Regular.ttf $out/share/fonts/truetype/DeliusSwashCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Delius Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
