{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ek-mukta-${version}";
  version = "2017-09-27-040242";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-ExtraLight.ttf?raw=true";
      name = "EkMukta-ExtraLight.ttf";
      sha256 = "4d793ee781d99bd9498d1089eb461bfb8133bf1b05e0a2dac659905206c06837";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-Light.ttf?raw=true";
      name = "EkMukta-Light.ttf";
      sha256 = "afabee30a12d8bdac36fc2b639e60f26e6f63b2f11613547cfca0d5e4167b54a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-Regular.ttf?raw=true";
      name = "EkMukta-Regular.ttf";
      sha256 = "d14f40a588b232cac9fb3063c707df93fc10e8d265694fc99fcfafcc8ab7b3b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-Medium.ttf?raw=true";
      name = "EkMukta-Medium.ttf";
      sha256 = "a98b7fad6cfae99c498b36002b290daf4c540cfb12dba86bab72f163299b0f56";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-SemiBold.ttf?raw=true";
      name = "EkMukta-SemiBold.ttf";
      sha256 = "26d85f32f084a74b3eb976c28fa148383ac9822b086d94a41bef4659f3cad568";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-Bold.ttf?raw=true";
      name = "EkMukta-Bold.ttf";
      sha256 = "1d62434625ca99e03acd200702ed5fd4d47231d134809807cdd7fb419f6409d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9d451f695f894391bc997052eec5931f08dc6a3d/ofl/ekmukta/EkMukta-ExtraBold.ttf?raw=true";
      name = "EkMukta-ExtraBold.ttf";
      sha256 = "9e9ffe6a3113b5b4720b56175bbef76836a9b0e9bb9effe4fc968b50d98f575a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EkMukta-ExtraLight.ttf $out/share/fonts/truetype/EkMukta-ExtraLight.ttf
     install -Dm644 EkMukta-Light.ttf $out/share/fonts/truetype/EkMukta-Light.ttf
     install -Dm644 EkMukta-Regular.ttf $out/share/fonts/truetype/EkMukta-Regular.ttf
     install -Dm644 EkMukta-Medium.ttf $out/share/fonts/truetype/EkMukta-Medium.ttf
     install -Dm644 EkMukta-SemiBold.ttf $out/share/fonts/truetype/EkMukta-SemiBold.ttf
     install -Dm644 EkMukta-Bold.ttf $out/share/fonts/truetype/EkMukta-Bold.ttf
     install -Dm644 EkMukta-ExtraBold.ttf $out/share/fonts/truetype/EkMukta-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ek Mukta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
