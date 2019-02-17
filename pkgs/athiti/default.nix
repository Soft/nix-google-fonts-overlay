{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "athiti-${version}";
  version = "2017-05-23-170816";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-ExtraLight.ttf?raw=true";
      name = "Athiti-ExtraLight.ttf";
      sha256 = "12737cd3ab743baa423ce14dde806672181c53aeca3fc596966da3a54c9db6e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-Light.ttf?raw=true";
      name = "Athiti-Light.ttf";
      sha256 = "f0a732e2336296b16c5d52cddd640902bac94a65b48d732e964f6f5a2a9627d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-Regular.ttf?raw=true";
      name = "Athiti-Regular.ttf";
      sha256 = "666f5474258cbffd537b494e2d6a441ee849778e2175a4e222d4d625c6efe0e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-Medium.ttf?raw=true";
      name = "Athiti-Medium.ttf";
      sha256 = "72d2657716b16233c8b093924d584044ab91a9ed997bc72dee152ca23c731bc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-SemiBold.ttf?raw=true";
      name = "Athiti-SemiBold.ttf";
      sha256 = "2e76cacba59a3e9d39cea52292d2e8a8ad9a6459336ab811bab0f141103544f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d776bc4c06ecc8f77c37146b2aa1a1788661f355/ofl/athiti/Athiti-Bold.ttf?raw=true";
      name = "Athiti-Bold.ttf";
      sha256 = "164aaaf1c046e834f418bc79ba5ffe636c79c2a26ec9146e1eaf9487cbeea833";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Athiti-ExtraLight.ttf $out/share/fonts/truetype/Athiti-ExtraLight.ttf
     install -Dm644 Athiti-Light.ttf $out/share/fonts/truetype/Athiti-Light.ttf
     install -Dm644 Athiti-Regular.ttf $out/share/fonts/truetype/Athiti-Regular.ttf
     install -Dm644 Athiti-Medium.ttf $out/share/fonts/truetype/Athiti-Medium.ttf
     install -Dm644 Athiti-SemiBold.ttf $out/share/fonts/truetype/Athiti-SemiBold.ttf
     install -Dm644 Athiti-Bold.ttf $out/share/fonts/truetype/Athiti-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Athiti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
