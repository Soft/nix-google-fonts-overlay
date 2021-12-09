{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sofia/Sofia-Regular.ttf?raw=true";
      name = "Sofia-Regular.ttf";
      sha256 = "5634c4ecf066fba2fa11645a3c5b41e830ca240e1eeab81e10b9d476101b1eea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sofia-Regular.ttf $out/share/fonts/truetype/Sofia-Regular.ttf
  '';

  meta = with lib; {
    description = "Sofia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
