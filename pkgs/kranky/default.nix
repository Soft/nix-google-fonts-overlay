{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kranky-${version}";
  version = "2017-08-07-204358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/811b12141fb5493644df15b181eb2af56f87ac11/apache/kranky/Kranky-Regular.ttf?raw=true";
      name = "Kranky-Regular.ttf";
      sha256 = "2b40548b2a84e3daa922f770657aefc86d4ce13d155b96912bea2d50bcb09cc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kranky-Regular.ttf $out/share/fonts/truetype/Kranky-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Kranky";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
