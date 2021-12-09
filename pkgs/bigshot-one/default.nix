{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bigshot-one-${version}";
  version = "2017-08-07-195203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c49ea130685460880723daee2fd781a441764075/ofl/bigshotone/BigshotOne-Regular.ttf?raw=true";
      name = "BigshotOne-Regular.ttf";
      sha256 = "3f87c969632dca932a76e875bb6931e32a003577436fe1f14eccefb274cf2ade";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigshotOne-Regular.ttf $out/share/fonts/truetype/BigshotOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bigshot One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
