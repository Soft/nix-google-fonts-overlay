{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allan-${version}";
  version = "2017-05-08-150127";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/895f9145a234dddf4ea2779a23434905305f87bd/ofl/allan/Allan-Regular.ttf?raw=true";
      name = "Allan-Regular.ttf";
      sha256 = "1216633f30f55dcfbe27f1f3a882a742ada9484a26ed26cbcf208f88e315b896";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/895f9145a234dddf4ea2779a23434905305f87bd/ofl/allan/Allan-Bold.ttf?raw=true";
      name = "Allan-Bold.ttf";
      sha256 = "c4d3781233b873ded3965200d4ea3b978ede2d7300d02c528da7a9ad9e7946ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Allan-Regular.ttf $out/share/fonts/truetype/Allan-Regular.ttf
     install -Dm644 Allan-Bold.ttf $out/share/fonts/truetype/Allan-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Allan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
