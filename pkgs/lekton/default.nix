{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lekton-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lekton/Lekton-Regular.ttf?raw=true";
      name = "Lekton-Regular.ttf";
      sha256 = "ccbb465d255a4bd0242af595d5f5410e635bd0dbf2f4b612b390e508a93d7a3a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lekton/Lekton-Italic.ttf?raw=true";
      name = "Lekton-Italic.ttf";
      sha256 = "ab5fb533f4ef21191a522b5c92e2bbccad6cf46d927a3fdc7617334a68977427";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lekton/Lekton-Bold.ttf?raw=true";
      name = "Lekton-Bold.ttf";
      sha256 = "9aab5a281f3428d882e67d9a945930822380f5b28ad00f5fbf79e21dadee375f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lekton-Regular.ttf $out/share/fonts/truetype/Lekton-Regular.ttf
     install -Dm644 Lekton-Italic.ttf $out/share/fonts/truetype/Lekton-Italic.ttf
     install -Dm644 Lekton-Bold.ttf $out/share/fonts/truetype/Lekton-Bold.ttf
  '';

  meta = with lib; {
    description = "Lekton";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
