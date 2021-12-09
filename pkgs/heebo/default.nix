{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "heebo-${version}";
  version = "2017-05-23-171636";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Thin.ttf?raw=true";
      name = "Heebo-Thin.ttf";
      sha256 = "282888026542eab51510a8a6e9025b2fe979ef57bbb91aabdbca4c0f4f68c37b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Light.ttf?raw=true";
      name = "Heebo-Light.ttf";
      sha256 = "93708eed0cc54350ab2f7874e94831e28d65fb461100364df21081388deeea10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Regular.ttf?raw=true";
      name = "Heebo-Regular.ttf";
      sha256 = "16061c98cb45e8651a78f25d6ff3d7883406974a1e3925622a851415c1be01fb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Medium.ttf?raw=true";
      name = "Heebo-Medium.ttf";
      sha256 = "b30d390280e0b7a7b9c396aa36e86444f4b8c8ac44b69b545e6e0c402d1d37bd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Bold.ttf?raw=true";
      name = "Heebo-Bold.ttf";
      sha256 = "d6d4f58992831e30f64bdad2a680924a29e0087ed98373e0d0becdf1a98e5d94";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-ExtraBold.ttf?raw=true";
      name = "Heebo-ExtraBold.ttf";
      sha256 = "d729c4dd42e4e9117e6539a737be90b244b8b78df53575d292fa68473e51221a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aead74269527cae7f9b1a47a92b434322e1b9f49/ofl/heebo/Heebo-Black.ttf?raw=true";
      name = "Heebo-Black.ttf";
      sha256 = "c88426a746bbe89da898988c999434dea6098c2df85926b190d336a5158d83bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Heebo-Thin.ttf $out/share/fonts/truetype/Heebo-Thin.ttf
     install -Dm644 Heebo-Light.ttf $out/share/fonts/truetype/Heebo-Light.ttf
     install -Dm644 Heebo-Regular.ttf $out/share/fonts/truetype/Heebo-Regular.ttf
     install -Dm644 Heebo-Medium.ttf $out/share/fonts/truetype/Heebo-Medium.ttf
     install -Dm644 Heebo-Bold.ttf $out/share/fonts/truetype/Heebo-Bold.ttf
     install -Dm644 Heebo-ExtraBold.ttf $out/share/fonts/truetype/Heebo-ExtraBold.ttf
     install -Dm644 Heebo-Black.ttf $out/share/fonts/truetype/Heebo-Black.ttf
  '';

  meta = with lib; {
    description = "Heebo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
