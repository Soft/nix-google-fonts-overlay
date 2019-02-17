{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "timmana-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/timmana/Timmana-Regular.ttf?raw=true";
      name = "Timmana-Regular.ttf";
      sha256 = "5882968b061fc3f45c0ff2868bc4becd16b1d5f385eca1a63e487af86b6d63c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Timmana-Regular.ttf $out/share/fonts/truetype/Timmana-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Timmana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
