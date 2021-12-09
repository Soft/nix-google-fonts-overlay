{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arimo-${version}";
  version = "2017-08-07-194414";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5e49edbd1875f214e0decae1e24b200066780fa8/apache/arimo/Arimo-Regular.ttf?raw=true";
      name = "Arimo-Regular.ttf";
      sha256 = "eafef8c99e94d10f17506c125e24d98a84256e0e665e6c659498eca96b19e148";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5e49edbd1875f214e0decae1e24b200066780fa8/apache/arimo/Arimo-Italic.ttf?raw=true";
      name = "Arimo-Italic.ttf";
      sha256 = "edcc229e781249b3f623061f5ac3f94b5fa6b880c85876f73b09b99b23ab6223";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5e49edbd1875f214e0decae1e24b200066780fa8/apache/arimo/Arimo-Bold.ttf?raw=true";
      name = "Arimo-Bold.ttf";
      sha256 = "89a9a8f88a1da4cc2a96238a19239ef85e12205ea06122e226dd36932cbd482e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5e49edbd1875f214e0decae1e24b200066780fa8/apache/arimo/Arimo-BoldItalic.ttf?raw=true";
      name = "Arimo-BoldItalic.ttf";
      sha256 = "35c0e8abf09b2f8855bb8e90ffbd5bee362c19f12a159298053ecb493332fe9a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arimo-Regular.ttf $out/share/fonts/truetype/Arimo-Regular.ttf
     install -Dm644 Arimo-Italic.ttf $out/share/fonts/truetype/Arimo-Italic.ttf
     install -Dm644 Arimo-Bold.ttf $out/share/fonts/truetype/Arimo-Bold.ttf
     install -Dm644 Arimo-BoldItalic.ttf $out/share/fonts/truetype/Arimo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Arimo";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
