{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "elsie-swash-caps-${version}";
  version = "2017-05-08-202245";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/557254baf20d404b6ff30ca0ab100da6cddaad01/ofl/elsieswashcaps/ElsieSwashCaps-Regular.ttf?raw=true";
      name = "ElsieSwashCaps-Regular.ttf";
      sha256 = "8ca1c544ecb26d6db3483522be473e9bc78e35b9b211b3e6e1ee5b1778b57537";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/557254baf20d404b6ff30ca0ab100da6cddaad01/ofl/elsieswashcaps/ElsieSwashCaps-Black.ttf?raw=true";
      name = "ElsieSwashCaps-Black.ttf";
      sha256 = "2b6d3b171e118d4381e03b288ad37db19a78eac12ebe20975375c7012bbe112b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ElsieSwashCaps-Regular.ttf $out/share/fonts/truetype/ElsieSwashCaps-Regular.ttf
     install -Dm644 ElsieSwashCaps-Black.ttf $out/share/fonts/truetype/ElsieSwashCaps-Black.ttf
  '';

  meta = with lib; {
    description = "Elsie Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
