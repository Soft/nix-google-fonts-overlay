{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "doppio-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/doppioone/DoppioOne-Regular.ttf?raw=true";
      name = "DoppioOne-Regular.ttf";
      sha256 = "2686a4eadfad03961f63e8474798a8b591d531aaa1bde6923481565830b19d9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DoppioOne-Regular.ttf $out/share/fonts/truetype/DoppioOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Doppio One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
