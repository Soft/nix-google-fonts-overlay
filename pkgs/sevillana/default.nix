{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sevillana-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/sevillana/Sevillana-Regular.ttf?raw=true";
      name = "Sevillana-Regular.ttf";
      sha256 = "2489af08e91d2a9befde3a3a2b6138749ff65dd74e2af0cb9bc3ff52d38fd20f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sevillana-Regular.ttf $out/share/fonts/truetype/Sevillana-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Sevillana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
