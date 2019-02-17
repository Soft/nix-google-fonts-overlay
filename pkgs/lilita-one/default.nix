{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lilita-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/lilitaone/LilitaOne-Regular.ttf?raw=true";
      name = "LilitaOne-Regular.ttf";
      sha256 = "f5b641c45c69d772ee4eda687bc9fda411d5cad6b0b45371491da4580cbc8d59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LilitaOne-Regular.ttf $out/share/fonts/truetype/LilitaOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lilita One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
