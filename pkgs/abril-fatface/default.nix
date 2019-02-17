{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abril-fatface-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/abrilfatface/AbrilFatface-Regular.ttf?raw=true";
      name = "AbrilFatface-Regular.ttf";
      sha256 = "5971d4a3758a922a9fedc7f6fb825a96341a2e718c45a4b2c9a6b417c8c4dbe9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AbrilFatface-Regular.ttf $out/share/fonts/truetype/AbrilFatface-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Abril Fatface";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
