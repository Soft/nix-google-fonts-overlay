{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "graduate-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/graduate/Graduate-Regular.ttf?raw=true";
      name = "Graduate-Regular.ttf";
      sha256 = "20f76f4193a1dc20ce64d7291ec0b88ebfdfdd2cf3e8cb87a9a3fbe530735d57";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Graduate-Regular.ttf $out/share/fonts/truetype/Graduate-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Graduate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
