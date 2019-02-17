{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anaheim-${version}";
  version = "2016-11-01-200725";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c7c2d7c04e0c99a629cc73ace52c0bcdba6f4708/ofl/anaheim/Anaheim-Regular.ttf?raw=true";
      name = "Anaheim-Regular.ttf";
      sha256 = "ec304bd65495967cc2339f7d8f3c37475b49d85f7f1140ee789f307d2706daa6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anaheim-Regular.ttf $out/share/fonts/truetype/Anaheim-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Anaheim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
