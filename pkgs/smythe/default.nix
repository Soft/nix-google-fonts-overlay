{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smythe-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/smythe/Smythe-Regular.ttf?raw=true";
      name = "Smythe-Regular.ttf";
      sha256 = "51207abbe4ef2d576b3033e95fc5bd30282c0db766807e1b8ae3f19d2540e11c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Smythe-Regular.ttf $out/share/fonts/truetype/Smythe-Regular.ttf
  '';

  meta = with lib; {
    description = "Smythe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
