{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "codystar-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/codystar/Codystar-Light.ttf?raw=true";
      name = "Codystar-Light.ttf";
      sha256 = "fa1fcf4f00f3c35b82219320a2322f561bc9e7f5ae6ded498a28958f5c07a3c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/codystar/Codystar-Regular.ttf?raw=true";
      name = "Codystar-Regular.ttf";
      sha256 = "99f059a3e31afdaf3fea53d39bc62b15df38a5d882104ae1d1a5ca2df547c10a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Codystar-Light.ttf $out/share/fonts/truetype/Codystar-Light.ttf
     install -Dm644 Codystar-Regular.ttf $out/share/fonts/truetype/Codystar-Regular.ttf
  '';

  meta = with lib; {
    description = "Codystar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
