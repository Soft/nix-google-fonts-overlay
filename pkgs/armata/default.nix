{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "armata-${version}";
  version = "2017-08-07-200935";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ecc5f91e743cb05a846e391b99246c033bf11bbf/ofl/armata/Armata-Regular.ttf?raw=true";
      name = "Armata-Regular.ttf";
      sha256 = "ee4a6a0410bafc1d0b46bd4551e5360d4ef7603eea1a9c783d46e9569a936905";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Armata-Regular.ttf $out/share/fonts/truetype/Armata-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Armata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
