{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "almendra-${version}";
  version = "2017-08-07-204803";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbfb186e46e3f44ae1e4f70490becbcc5386e0de/ofl/almendra/Almendra-Regular.ttf?raw=true";
      name = "Almendra-Regular.ttf";
      sha256 = "b127a6121209353b53da9ce73bf9d350f74190d8384c28ede179e4fb9440f946";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbfb186e46e3f44ae1e4f70490becbcc5386e0de/ofl/almendra/Almendra-Italic.ttf?raw=true";
      name = "Almendra-Italic.ttf";
      sha256 = "972eb95dd030592755064c35e8e394b75423973d0b7dbfd759c7e36ef80bb7cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbfb186e46e3f44ae1e4f70490becbcc5386e0de/ofl/almendra/Almendra-Bold.ttf?raw=true";
      name = "Almendra-Bold.ttf";
      sha256 = "5895ef04d0d56c60083ec302e72db99b952b044ab2b440ee12283649b5edc971";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cbfb186e46e3f44ae1e4f70490becbcc5386e0de/ofl/almendra/Almendra-BoldItalic.ttf?raw=true";
      name = "Almendra-BoldItalic.ttf";
      sha256 = "10e0a7dd4b9f5ad7d51be7f8ee42d76919c322dcbb7733dbad48f4ac751cb105";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Almendra-Regular.ttf $out/share/fonts/truetype/Almendra-Regular.ttf
     install -Dm644 Almendra-Italic.ttf $out/share/fonts/truetype/Almendra-Italic.ttf
     install -Dm644 Almendra-Bold.ttf $out/share/fonts/truetype/Almendra-Bold.ttf
     install -Dm644 Almendra-BoldItalic.ttf $out/share/fonts/truetype/Almendra-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Almendra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
