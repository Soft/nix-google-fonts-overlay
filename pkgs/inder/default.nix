{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inder-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/inder/Inder-Regular.ttf?raw=true";
      name = "Inder-Regular.ttf";
      sha256 = "7e9922756c6879c6aed60b1f880fcd3067c44c8f3328830909d1091b11168fc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inder-Regular.ttf $out/share/fonts/truetype/Inder-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Inder";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
