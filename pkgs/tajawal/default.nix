{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tajawal-${version}";
  version = "2018-04-04-145825";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-ExtraLight.ttf?raw=true";
      name = "Tajawal-ExtraLight.ttf";
      sha256 = "a12ffbfaaec30ab8142edc60fa4727b104a90eb54c6a200a76988a1ec2ec11dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-Light.ttf?raw=true";
      name = "Tajawal-Light.ttf";
      sha256 = "ab26ed3e0c5af2c71b469b5780decff8088d290ab91aa29b07321580136e813a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-Regular.ttf?raw=true";
      name = "Tajawal-Regular.ttf";
      sha256 = "6882892da3e03527d5db2bbab3b48bde6ef2e878a43f522d1a4eebda90010a19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-Medium.ttf?raw=true";
      name = "Tajawal-Medium.ttf";
      sha256 = "1ff8bd943a261c9dd7906bdb1993cab87b6d925a7fb5f848cdb51ed301531090";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-Bold.ttf?raw=true";
      name = "Tajawal-Bold.ttf";
      sha256 = "0342ab6b74b6bd1b4b5bf7beda45a9734a2b3147a31e8a3a45b6a3417a52d9d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-ExtraBold.ttf?raw=true";
      name = "Tajawal-ExtraBold.ttf";
      sha256 = "3d1298b747c22579f9e1bdeb0d4165064cb17f7e66145e2f43f9deb12ad7a2cf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b481f8b7bcb2d3efd02f4c97048fa001f17efd5/ofl/tajawal/Tajawal-Black.ttf?raw=true";
      name = "Tajawal-Black.ttf";
      sha256 = "da582a579d3200869535dc994d2349608a8582042f8776b3679b157015db287c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tajawal-ExtraLight.ttf $out/share/fonts/truetype/Tajawal-ExtraLight.ttf
     install -Dm644 Tajawal-Light.ttf $out/share/fonts/truetype/Tajawal-Light.ttf
     install -Dm644 Tajawal-Regular.ttf $out/share/fonts/truetype/Tajawal-Regular.ttf
     install -Dm644 Tajawal-Medium.ttf $out/share/fonts/truetype/Tajawal-Medium.ttf
     install -Dm644 Tajawal-Bold.ttf $out/share/fonts/truetype/Tajawal-Bold.ttf
     install -Dm644 Tajawal-ExtraBold.ttf $out/share/fonts/truetype/Tajawal-ExtraBold.ttf
     install -Dm644 Tajawal-Black.ttf $out/share/fonts/truetype/Tajawal-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Tajawal";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
