{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bangers-${version}";
  version = "2016-12-02-173251";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6a5743e871dea40d1ae5e5889f7bcbb6aab14aad/ofl/bangers/Bangers-Regular.ttf?raw=true";
      name = "Bangers-Regular.ttf";
      sha256 = "bedd2be09f6c3503034f76174d0e6e144fd5ba40d4bdec67049acfaac93aeb6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bangers-Regular.ttf $out/share/fonts/truetype/Bangers-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bangers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
