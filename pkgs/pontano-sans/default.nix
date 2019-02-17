{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pontano-sans-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/pontanosans/PontanoSans-Regular.ttf?raw=true";
      name = "PontanoSans-Regular.ttf";
      sha256 = "d82dab3318176d696707ddf6687bb5ca7e9702b5429ecd2f304087c6fbd3f9b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PontanoSans-Regular.ttf $out/share/fonts/truetype/PontanoSans-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pontano Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
