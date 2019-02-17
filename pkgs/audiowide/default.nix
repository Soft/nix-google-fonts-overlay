{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "audiowide-${version}";
  version = "2017-08-07-195934";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1b455676f8b151016e98875bb421405533fdb54a/ofl/audiowide/Audiowide-Regular.ttf?raw=true";
      name = "Audiowide-Regular.ttf";
      sha256 = "c7c0f2b0f6fad8c623e31772ce79f94a4edb9321ffce9fce978ea892d20ae730";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Audiowide-Regular.ttf $out/share/fonts/truetype/Audiowide-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Audiowide";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
