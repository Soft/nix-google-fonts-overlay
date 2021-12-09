{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "junge-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/junge/Junge-Regular.ttf?raw=true";
      name = "Junge-Regular.ttf";
      sha256 = "4671c65a0e6c02c866362938e968e083d171744e4c90fa2cfa8b809cc9f7207e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Junge-Regular.ttf $out/share/fonts/truetype/Junge-Regular.ttf
  '';

  meta = with lib; {
    description = "Junge";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
