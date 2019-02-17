{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "esteban-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/esteban/Esteban-Regular.ttf?raw=true";
      name = "Esteban-Regular.ttf";
      sha256 = "117f80a823d1899df85708a59e39ef0f0d974a7407a845543288612f8214e68f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Esteban-Regular.ttf $out/share/fonts/truetype/Esteban-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Esteban";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
