{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "titillium-web-${version}";
  version = "2017-05-09-190412";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-ExtraLight.ttf?raw=true";
      name = "TitilliumWeb-ExtraLight.ttf";
      sha256 = "38d310af66c015016c39455b0fde799d83980b844fd1f5d4c45ef558e6d700a2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-ExtraLightItalic.ttf?raw=true";
      name = "TitilliumWeb-ExtraLightItalic.ttf";
      sha256 = "3160c0243db4ba708a5a6ffade89847d506a5fe7accc06423dd1705a6a47aebb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-Light.ttf?raw=true";
      name = "TitilliumWeb-Light.ttf";
      sha256 = "c9bbaf3fdb9cfcfa4a1b4e860f2c5ee32158e80b6b0f1160b40dda2c98037d10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-LightItalic.ttf?raw=true";
      name = "TitilliumWeb-LightItalic.ttf";
      sha256 = "cc48c25d01e36a414864de23e223145e9b76234e2a12beeac8d204c83ccafc45";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-Regular.ttf?raw=true";
      name = "TitilliumWeb-Regular.ttf";
      sha256 = "7b6b4452c65cc8b8522e92e7d4d4c2e6d7675341ceafd041bb6bd30297517ea5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-Italic.ttf?raw=true";
      name = "TitilliumWeb-Italic.ttf";
      sha256 = "4f08e681c1b38f825125a1a5a9c8a38d0eb94eea51b04cdb2a17cbec47f90833";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-SemiBold.ttf?raw=true";
      name = "TitilliumWeb-SemiBold.ttf";
      sha256 = "7c92f15302d7ac1836015cb9cf4068796406667b304a061b75df8e11f1648c81";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-SemiBoldItalic.ttf?raw=true";
      name = "TitilliumWeb-SemiBoldItalic.ttf";
      sha256 = "dcc38dfead3e114992922cb06844d467ce5cfe62baba841ff4053c250dcb41e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-Bold.ttf?raw=true";
      name = "TitilliumWeb-Bold.ttf";
      sha256 = "e2e8e1812041e2c5868f1d03ac24994312052c5381cca2e80748f08cb7e13093";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-BoldItalic.ttf?raw=true";
      name = "TitilliumWeb-BoldItalic.ttf";
      sha256 = "744068ee0f1623c61567b0981d51c49edba012d74c5ba73076847c0143284a25";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93550bd32b353b74c90d683d0f00251a3f7b314d/ofl/titilliumweb/TitilliumWeb-Black.ttf?raw=true";
      name = "TitilliumWeb-Black.ttf";
      sha256 = "6e064771c29aee4c79c9aebbd560db79faa71f4c1944ea27f12d82be8a04b1cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TitilliumWeb-ExtraLight.ttf $out/share/fonts/truetype/TitilliumWeb-ExtraLight.ttf
     install -Dm644 TitilliumWeb-ExtraLightItalic.ttf $out/share/fonts/truetype/TitilliumWeb-ExtraLightItalic.ttf
     install -Dm644 TitilliumWeb-Light.ttf $out/share/fonts/truetype/TitilliumWeb-Light.ttf
     install -Dm644 TitilliumWeb-LightItalic.ttf $out/share/fonts/truetype/TitilliumWeb-LightItalic.ttf
     install -Dm644 TitilliumWeb-Regular.ttf $out/share/fonts/truetype/TitilliumWeb-Regular.ttf
     install -Dm644 TitilliumWeb-Italic.ttf $out/share/fonts/truetype/TitilliumWeb-Italic.ttf
     install -Dm644 TitilliumWeb-SemiBold.ttf $out/share/fonts/truetype/TitilliumWeb-SemiBold.ttf
     install -Dm644 TitilliumWeb-SemiBoldItalic.ttf $out/share/fonts/truetype/TitilliumWeb-SemiBoldItalic.ttf
     install -Dm644 TitilliumWeb-Bold.ttf $out/share/fonts/truetype/TitilliumWeb-Bold.ttf
     install -Dm644 TitilliumWeb-BoldItalic.ttf $out/share/fonts/truetype/TitilliumWeb-BoldItalic.ttf
     install -Dm644 TitilliumWeb-Black.ttf $out/share/fonts/truetype/TitilliumWeb-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Titillium Web";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
