{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lalezar-${version}";
  version = "2017-05-01-173639";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1251c03730dbed7d4cc7ff8029bdb054559cd6b4/ofl/lalezar/Lalezar-Regular.ttf?raw=true";
      name = "Lalezar-Regular.ttf";
      sha256 = "7b80807bc831f141de0f7dcf6816412bf0c548968d548c5156ca388733390ea9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lalezar-Regular.ttf $out/share/fonts/truetype/Lalezar-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lalezar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
