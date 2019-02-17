{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "benchnine-${version}";
  version = "2017-05-08-150438";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2c5a5809aa0b6c82e4068abe35916a6b8b6ef64/ofl/benchnine/BenchNine-Light.ttf?raw=true";
      name = "BenchNine-Light.ttf";
      sha256 = "b1a0aa5fd59b09aff1e396fb617c7ca9223c39e1bbbc1199d96784a8ce707878";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2c5a5809aa0b6c82e4068abe35916a6b8b6ef64/ofl/benchnine/BenchNine-Regular.ttf?raw=true";
      name = "BenchNine-Regular.ttf";
      sha256 = "abc1e1dfcfcf8fecf322d85bd461f308a68d313ab2a82f4f192d9580a82bb0d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b2c5a5809aa0b6c82e4068abe35916a6b8b6ef64/ofl/benchnine/BenchNine-Bold.ttf?raw=true";
      name = "BenchNine-Bold.ttf";
      sha256 = "5d3c445184569f424ed6d434cad16bdda130c5a395f79e2674f447cd5495cb97";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BenchNine-Light.ttf $out/share/fonts/truetype/BenchNine-Light.ttf
     install -Dm644 BenchNine-Regular.ttf $out/share/fonts/truetype/BenchNine-Regular.ttf
     install -Dm644 BenchNine-Bold.ttf $out/share/fonts/truetype/BenchNine-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "BenchNine";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
