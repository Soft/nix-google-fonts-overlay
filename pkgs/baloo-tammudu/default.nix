{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-tammudu-${version}";
  version = "2017-08-07-185639";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a5193ca23a724f9175dd91b5ab5d3fc061aa5a48/ofl/balootammudu/BalooTammudu-Regular.ttf?raw=true";
      name = "BalooTammudu-Regular.ttf";
      sha256 = "eed806b10921dfab5567fe953cba507d49f76c2ac61ef6f863b60c5086ed2d7a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooTammudu-Regular.ttf $out/share/fonts/truetype/BalooTammudu-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Baloo Tammudu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
