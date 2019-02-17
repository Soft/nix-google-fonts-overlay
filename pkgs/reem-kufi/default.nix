{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-${version}";
  version = "2017-08-30-211904";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d7a63456e5e85b80199de23d3686be439cad5a52/ofl/reemkufi/ReemKufi-Regular.ttf?raw=true";
      name = "ReemKufi-Regular.ttf";
      sha256 = "ea139970598b2fe720c5ddab2a0e2483460759bc626931104aa1adb9c4ef6b9a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufi-Regular.ttf $out/share/fonts/truetype/ReemKufi-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Reem Kufi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
