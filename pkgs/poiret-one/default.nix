{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poiret-one-${version}";
  version = "2017-02-21-140818";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/36ca1a45b594aa73b65c74238799224496b2cc0e/ofl/poiretone/PoiretOne-Regular.ttf?raw=true";
      name = "PoiretOne-Regular.ttf";
      sha256 = "457f2d03263f58e5a6dbcc1b607b10dff6581e7cf9c4ebdf330ec3e6772a3558";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoiretOne-Regular.ttf $out/share/fonts/truetype/PoiretOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Poiret One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
