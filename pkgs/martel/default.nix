{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "martel-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-UltraLight.ttf?raw=true";
      name = "Martel-UltraLight.ttf";
      sha256 = "775fa07561b055b31297ad2f05bf5f45eddc1645318ed2c419724a41b09cf010";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-Light.ttf?raw=true";
      name = "Martel-Light.ttf";
      sha256 = "589537240a3d2c06793c5e7d5f85fc60a4ceba9b95e35206f3a7b5d90f6f6938";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-Regular.ttf?raw=true";
      name = "Martel-Regular.ttf";
      sha256 = "b733e56144115d5da6a6415d2971ab97b7262948d172e27309ad00ce9096b876";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-DemiBold.ttf?raw=true";
      name = "Martel-DemiBold.ttf";
      sha256 = "6be979323225cd9d1a3964403b2771816e007610ee68d8d4bf08a75f2e7e08bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-Bold.ttf?raw=true";
      name = "Martel-Bold.ttf";
      sha256 = "072b7259061a99128e50056b081024975dfc6e4c0b265ab99f75bf66bd50c338";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-ExtraBold.ttf?raw=true";
      name = "Martel-ExtraBold.ttf";
      sha256 = "5bc47c0d423242f1dc9f7e33246cf264c72fb0672ebc76d4774494fe71ccf9a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc4d5c7d6433088cf9c87913a4bcac5bcab2965d/ofl/martel/Martel-Heavy.ttf?raw=true";
      name = "Martel-Heavy.ttf";
      sha256 = "6122fc615d2ea31a44380737c679d6193a2de5a263f6bd6b329679b4f640609e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Martel-UltraLight.ttf $out/share/fonts/truetype/Martel-UltraLight.ttf
     install -Dm644 Martel-Light.ttf $out/share/fonts/truetype/Martel-Light.ttf
     install -Dm644 Martel-Regular.ttf $out/share/fonts/truetype/Martel-Regular.ttf
     install -Dm644 Martel-DemiBold.ttf $out/share/fonts/truetype/Martel-DemiBold.ttf
     install -Dm644 Martel-Bold.ttf $out/share/fonts/truetype/Martel-Bold.ttf
     install -Dm644 Martel-ExtraBold.ttf $out/share/fonts/truetype/Martel-ExtraBold.ttf
     install -Dm644 Martel-Heavy.ttf $out/share/fonts/truetype/Martel-Heavy.ttf
  '';

  meta = with stdenv.lib; {
    description = "Martel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
