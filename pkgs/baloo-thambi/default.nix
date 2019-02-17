{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-thambi-${version}";
  version = "2017-08-07-193336";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec0ce17ea5647a1b44ac511db2f99608fee77f4b/ofl/baloothambi/BalooThambi-Regular.ttf?raw=true";
      name = "BalooThambi-Regular.ttf";
      sha256 = "348cd45392143e36df5641de2e596a0901c1996e56476b2119bce9b93f204c30";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooThambi-Regular.ttf $out/share/fonts/truetype/BalooThambi-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Thambi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
