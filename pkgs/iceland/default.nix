{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "iceland-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/iceland/Iceland-Regular.ttf?raw=true";
      name = "Iceland-Regular.ttf";
      sha256 = "5b5919189e5d01a6fac79251aaf9fa9565a738c39974cbe13de98ac02ec7fff5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Iceland-Regular.ttf $out/share/fonts/truetype/Iceland-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Iceland";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
