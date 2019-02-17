{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cutive-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/cutive/Cutive-Regular.ttf?raw=true";
      name = "Cutive-Regular.ttf";
      sha256 = "3995832e966644c404d0e9e815c258aab80961342c80731884bff27319b84e4b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cutive-Regular.ttf $out/share/fonts/truetype/Cutive-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cutive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
