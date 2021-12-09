{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kenia-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/kenia/Kenia-Regular.ttf?raw=true";
      name = "Kenia-Regular.ttf";
      sha256 = "4052e03cdabd35ef9f739fdf1462b1b26c16b2238ba27223238624a2bb5565b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kenia-Regular.ttf $out/share/fonts/truetype/Kenia-Regular.ttf
  '';

  meta = with lib; {
    description = "Kenia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
