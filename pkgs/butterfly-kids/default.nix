{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butterfly-kids-${version}";
  version = "2017-08-07-200718";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4c300c5d1647425354921554490c191e54b19229/ofl/butterflykids/ButterflyKids-Regular.ttf?raw=true";
      name = "ButterflyKids-Regular.ttf";
      sha256 = "4a131f49c3d90e816e6447d244090eb2c36cdbf26be53254271ccdf2d8d111b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ButterflyKids-Regular.ttf $out/share/fonts/truetype/ButterflyKids-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Butterfly Kids";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
