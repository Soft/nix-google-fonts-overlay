{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gemunu-libre-${version}";
  version = "2017-05-16-003650";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-ExtraLight.ttf?raw=true";
      name = "GemunuLibre-ExtraLight.ttf";
      sha256 = "8147fa577fa0e9e787ad2f131a5cf846565199fb139ba1d2d232d21a819d70c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-Light.ttf?raw=true";
      name = "GemunuLibre-Light.ttf";
      sha256 = "7cf795c769ef61eacbe31d5f3315c5eccade92f2b71d2f54a96013696e39e2a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-Regular.ttf?raw=true";
      name = "GemunuLibre-Regular.ttf";
      sha256 = "c98c645d0e477009ac97ac5a0ec6fecf2bb288e34ecffb244f0548f93d47a42e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-Medium.ttf?raw=true";
      name = "GemunuLibre-Medium.ttf";
      sha256 = "565ce530413584e0aa77af5fa6948482a13117f285d503db3e7b822c0fc50b8d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-SemiBold.ttf?raw=true";
      name = "GemunuLibre-SemiBold.ttf";
      sha256 = "e2845ad75e2d78189ab71196d27bc37869c744961e6e5696d8364c0151efd756";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-Bold.ttf?raw=true";
      name = "GemunuLibre-Bold.ttf";
      sha256 = "531370054ef0ec777d33ea357dd9fce351293cfb6477edcdaa422f577d85defd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d6d46b99bfe42f8729b039a1579eaaa26f79e29/ofl/gemunulibre/GemunuLibre-ExtraBold.ttf?raw=true";
      name = "GemunuLibre-ExtraBold.ttf";
      sha256 = "fdd071c7b9647196853c865f0206a7f04b5041aacd7fb40ab8ee5bff48a36d25";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GemunuLibre-ExtraLight.ttf $out/share/fonts/truetype/GemunuLibre-ExtraLight.ttf
     install -Dm644 GemunuLibre-Light.ttf $out/share/fonts/truetype/GemunuLibre-Light.ttf
     install -Dm644 GemunuLibre-Regular.ttf $out/share/fonts/truetype/GemunuLibre-Regular.ttf
     install -Dm644 GemunuLibre-Medium.ttf $out/share/fonts/truetype/GemunuLibre-Medium.ttf
     install -Dm644 GemunuLibre-SemiBold.ttf $out/share/fonts/truetype/GemunuLibre-SemiBold.ttf
     install -Dm644 GemunuLibre-Bold.ttf $out/share/fonts/truetype/GemunuLibre-Bold.ttf
     install -Dm644 GemunuLibre-ExtraBold.ttf $out/share/fonts/truetype/GemunuLibre-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Gemunu Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
