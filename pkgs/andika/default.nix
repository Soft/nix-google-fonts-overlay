{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andika-${version}";
  version = "2017-08-07-194117";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/489f903d6d93cd9fe48d3fa2de0ddc9d8a77950b/ofl/andika/Andika-Regular.ttf?raw=true";
      name = "Andika-Regular.ttf";
      sha256 = "20284dc6ed1f6a816dee0cb6937ee8cf4c7a76cc2fabf51965420d14e572f523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Andika-Regular.ttf $out/share/fonts/truetype/Andika-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Andika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
