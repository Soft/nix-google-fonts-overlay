{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chau-philomene-one-${version}";
  version = "2017-05-08-150912";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d9ed9ba11bcb6b06f4326d8939563ce3867d1dc/ofl/chauphilomeneone/ChauPhilomeneOne-Regular.ttf?raw=true";
      name = "ChauPhilomeneOne-Regular.ttf";
      sha256 = "2b9fffaa99f228498ee104bab524d7932eb1c49dd635e6be2a060c8ec999c9cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d9ed9ba11bcb6b06f4326d8939563ce3867d1dc/ofl/chauphilomeneone/ChauPhilomeneOne-Italic.ttf?raw=true";
      name = "ChauPhilomeneOne-Italic.ttf";
      sha256 = "4a010ccb1f317377ed9f4b47604102a5db3e50533d37d805d3322e56797218e0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChauPhilomeneOne-Regular.ttf $out/share/fonts/truetype/ChauPhilomeneOne-Regular.ttf
     install -Dm644 ChauPhilomeneOne-Italic.ttf $out/share/fonts/truetype/ChauPhilomeneOne-Italic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chau Philomene One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
