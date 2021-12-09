{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "six-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sixcaps/SixCaps.ttf?raw=true";
      name = "SixCaps.ttf";
      sha256 = "7b54a46671722fb670647c9c3951e6e618b6a9d876fc5d9ae34dfd311628ae5a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SixCaps.ttf $out/share/fonts/truetype/SixCaps.ttf
  '';

  meta = with lib; {
    description = "Six Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
