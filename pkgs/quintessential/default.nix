{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quintessential-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/quintessential/Quintessential-Regular.ttf?raw=true";
      name = "Quintessential-Regular.ttf";
      sha256 = "73d192f10dbfc716214aae282afb93036f12415d16adc9d6d0e981f34d829d32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quintessential-Regular.ttf $out/share/fonts/truetype/Quintessential-Regular.ttf
  '';

  meta = with lib; {
    description = "Quintessential";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
