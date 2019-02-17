{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "telex-${version}";
  version = "2016-12-02-172742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7ae33d0883b4578dac5f92c951277431e5c12ce8/ofl/telex/Telex-Regular.ttf?raw=true";
      name = "Telex-Regular.ttf";
      sha256 = "eeaa2d17d105b6b46e5368ecd990f5b19c50131ff922dbf79bfb9bb45c249871";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Telex-Regular.ttf $out/share/fonts/truetype/Telex-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Telex";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
