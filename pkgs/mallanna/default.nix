{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mallanna-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/mallanna/Mallanna-Regular.ttf?raw=true";
      name = "Mallanna-Regular.ttf";
      sha256 = "73e5769253565b284aded5d9da1f98c6a10b0da5ba75b40b3c236239fcc23f76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mallanna-Regular.ttf $out/share/fonts/truetype/Mallanna-Regular.ttf
  '';

  meta = with lib; {
    description = "Mallanna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
