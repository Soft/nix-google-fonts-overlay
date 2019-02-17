{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caveat-${version}";
  version = "2017-10-31-191955";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d94ab3fa53fb90021cd41812321e375bc3cd13c0/ofl/caveat/Caveat-Regular.ttf?raw=true";
      name = "Caveat-Regular.ttf";
      sha256 = "1032c62be2d76b9a287a574e86dc68c9bf31780488876841f3c4bfe41fbdfae1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d94ab3fa53fb90021cd41812321e375bc3cd13c0/ofl/caveat/Caveat-Bold.ttf?raw=true";
      name = "Caveat-Bold.ttf";
      sha256 = "d76fc1e291ab0e0d9d0b907708684ea9633c595105f3c9e008beeb1e6534379e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caveat-Regular.ttf $out/share/fonts/truetype/Caveat-Regular.ttf
     install -Dm644 Caveat-Bold.ttf $out/share/fonts/truetype/Caveat-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Caveat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
