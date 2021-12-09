{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "krub-${version}";
  version = "2018-09-07-134513";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-ExtraLight.ttf?raw=true";
      name = "Krub-ExtraLight.ttf";
      sha256 = "6b5b32c071d7b6656f2a34a58ac78991c5dca5679f300ee59e12a6ee434fde37";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-ExtraLightItalic.ttf?raw=true";
      name = "Krub-ExtraLightItalic.ttf";
      sha256 = "bf6139882b5f3dbbfa000844145ee51df7ce3bb4b330943602094558a18fcba6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-Light.ttf?raw=true";
      name = "Krub-Light.ttf";
      sha256 = "bb537914c72d5bbb305d161546dc3ccccfdd7bef69c59e27ce4b740b9ea39bf3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-LightItalic.ttf?raw=true";
      name = "Krub-LightItalic.ttf";
      sha256 = "eb4290e7174a37f0cc71b9096813a2d8a9c7119c93467ab6f7c0028955d80229";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-Regular.ttf?raw=true";
      name = "Krub-Regular.ttf";
      sha256 = "24e5c4084ee9e878d54e70bfe5fceccf3ae46fd4aae73a794c04df4091f5e69d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-Italic.ttf?raw=true";
      name = "Krub-Italic.ttf";
      sha256 = "3b1b9a1740e0ee096806c5d82867d3e28816575bfffb07885d84f7b4d9fe2937";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-Medium.ttf?raw=true";
      name = "Krub-Medium.ttf";
      sha256 = "cdf7274a4822c9e0eebc1b503650ab3703bc968082a7ebbaaf69a3bfb605d477";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-MediumItalic.ttf?raw=true";
      name = "Krub-MediumItalic.ttf";
      sha256 = "6f4059366153fa39f651ab2c0b193b7a030fdae305ea9ae5877681d099a87904";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-SemiBold.ttf?raw=true";
      name = "Krub-SemiBold.ttf";
      sha256 = "9a3403dad454c45cc4f1fbe0bfc0001c842302ddda514c47285925b7921f5602";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-SemiBoldItalic.ttf?raw=true";
      name = "Krub-SemiBoldItalic.ttf";
      sha256 = "c273f16ce968d402bf144e5bb82e074e6af9bc261c200c374d57d13bf077af4e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-Bold.ttf?raw=true";
      name = "Krub-Bold.ttf";
      sha256 = "0b8c2684736742e181f48ed7d9b0aed10ac2d4e1e3a02c8346e5300a4a07f100";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7061dc9601a058bb73b3612f09309327c8367a39/ofl/krub/Krub-BoldItalic.ttf?raw=true";
      name = "Krub-BoldItalic.ttf";
      sha256 = "b4363ba5369dc7cd1380932d7e4adcdce0f2190ae6ad659dea37cb7a45448d25";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Krub-ExtraLight.ttf $out/share/fonts/truetype/Krub-ExtraLight.ttf
     install -Dm644 Krub-ExtraLightItalic.ttf $out/share/fonts/truetype/Krub-ExtraLightItalic.ttf
     install -Dm644 Krub-Light.ttf $out/share/fonts/truetype/Krub-Light.ttf
     install -Dm644 Krub-LightItalic.ttf $out/share/fonts/truetype/Krub-LightItalic.ttf
     install -Dm644 Krub-Regular.ttf $out/share/fonts/truetype/Krub-Regular.ttf
     install -Dm644 Krub-Italic.ttf $out/share/fonts/truetype/Krub-Italic.ttf
     install -Dm644 Krub-Medium.ttf $out/share/fonts/truetype/Krub-Medium.ttf
     install -Dm644 Krub-MediumItalic.ttf $out/share/fonts/truetype/Krub-MediumItalic.ttf
     install -Dm644 Krub-SemiBold.ttf $out/share/fonts/truetype/Krub-SemiBold.ttf
     install -Dm644 Krub-SemiBoldItalic.ttf $out/share/fonts/truetype/Krub-SemiBoldItalic.ttf
     install -Dm644 Krub-Bold.ttf $out/share/fonts/truetype/Krub-Bold.ttf
     install -Dm644 Krub-BoldItalic.ttf $out/share/fonts/truetype/Krub-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Krub";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
