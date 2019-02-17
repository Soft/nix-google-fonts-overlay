{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aladin-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/40ee6ca60db99f23f03b8d005dcc35154f3b804f/ofl/aladin/Aladin-Regular.ttf?raw=true";
      name = "Aladin-Regular.ttf";
      sha256 = "c7ee57e19b1b2c89f8d786115dc69225091ff7665f30fea7908bc2fb27d13398";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aladin-Regular.ttf $out/share/fonts/truetype/Aladin-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Aladin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
