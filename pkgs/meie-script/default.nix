{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "meie-script-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/meiescript/MeieScript-Regular.ttf?raw=true";
      name = "MeieScript-Regular.ttf";
      sha256 = "006c66ba5d8de0b824821d9444ba97b149e26715944c1a8ab427bbb35704e6c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeieScript-Regular.ttf $out/share/fonts/truetype/MeieScript-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Meie Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
