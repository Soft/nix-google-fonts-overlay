{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredoka-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/fredokaone/FredokaOne-Regular.ttf?raw=true";
      name = "FredokaOne-Regular.ttf";
      sha256 = "a2fbb1416510efe20330272bc182d667efe1507db5faecde893084fb15953973";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FredokaOne-Regular.ttf $out/share/fonts/truetype/FredokaOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Fredoka One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
