{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pridi-${version}";
  version = "2017-05-16-161325";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-ExtraLight.ttf?raw=true";
      name = "Pridi-ExtraLight.ttf";
      sha256 = "12f2ed9cd258b585083be1a6faa490c6e41917d95a4fbe045fdb43819eed8a9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-Light.ttf?raw=true";
      name = "Pridi-Light.ttf";
      sha256 = "3f328cfdface42003202df36d275b0d3498c7484dd384add3fbb066c5829dab0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-Regular.ttf?raw=true";
      name = "Pridi-Regular.ttf";
      sha256 = "cc5a2ea9660d78fc64c909c29582ab8bd7195128f81bed825d7cee985369a4da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-Medium.ttf?raw=true";
      name = "Pridi-Medium.ttf";
      sha256 = "d38ca6dd91f8ede51cb793dc05c56c2381a4933a8849ddc09281ecb50943294b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-SemiBold.ttf?raw=true";
      name = "Pridi-SemiBold.ttf";
      sha256 = "afb99e891ab2ada5072940193766bffb53a836f7e75cd8ec85213a61edde4ce4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9e30137d1271fcdc9045a9c0fbbdb4a87badf4d8/ofl/pridi/Pridi-Bold.ttf?raw=true";
      name = "Pridi-Bold.ttf";
      sha256 = "7ed16f946290c59f336c1cb031a80a5fd4ae60e6c261bffa9e06c92df6865ff4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pridi-ExtraLight.ttf $out/share/fonts/truetype/Pridi-ExtraLight.ttf
     install -Dm644 Pridi-Light.ttf $out/share/fonts/truetype/Pridi-Light.ttf
     install -Dm644 Pridi-Regular.ttf $out/share/fonts/truetype/Pridi-Regular.ttf
     install -Dm644 Pridi-Medium.ttf $out/share/fonts/truetype/Pridi-Medium.ttf
     install -Dm644 Pridi-SemiBold.ttf $out/share/fonts/truetype/Pridi-SemiBold.ttf
     install -Dm644 Pridi-Bold.ttf $out/share/fonts/truetype/Pridi-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Pridi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
