{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barlow-semi-condensed-${version}";
  version = "2018-12-05-153357";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Thin.ttf?raw=true";
      name = "BarlowSemiCondensed-Thin.ttf";
      sha256 = "f2ca25edad258019d88879a9a8ae1a952a7a7f68dadef945954c63bacda08026";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-ThinItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-ThinItalic.ttf";
      sha256 = "43935a8989c3a2bc0e57c3d491ab4dfd22217fef373eae069df30e610e32b7ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-ExtraLight.ttf?raw=true";
      name = "BarlowSemiCondensed-ExtraLight.ttf";
      sha256 = "e1ffda60bc25a7f3682785c287b1a167838e786fc018130f7a6907a15e4d0d14";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-ExtraLightItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-ExtraLightItalic.ttf";
      sha256 = "026abcc59634f6e118dd29fae727882bbfe8eac5e77aa671aa4f4d49355b0a57";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Light.ttf?raw=true";
      name = "BarlowSemiCondensed-Light.ttf";
      sha256 = "cc4a1ad3d68ec017a79b098228e76c722ed92e5e791978467c76437186f22a03";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-LightItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-LightItalic.ttf";
      sha256 = "4d4030bb4cc8ec04ee017c3c9fed37f069c357eab07f972028efafe1e7ad14b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Regular.ttf?raw=true";
      name = "BarlowSemiCondensed-Regular.ttf";
      sha256 = "e8c7242f612b13d026e18a94b63b0fd079e91a3faf009d1b6981dbb5f16d1153";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Italic.ttf?raw=true";
      name = "BarlowSemiCondensed-Italic.ttf";
      sha256 = "6ce28204c8a48369f254055fccf1784fe10ec7fcc26f84a300d5165ddfc0cb0a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Medium.ttf?raw=true";
      name = "BarlowSemiCondensed-Medium.ttf";
      sha256 = "4998b693a190b76f2b11315844345a8546c1e2e6a320905507a9eed04edf8b48";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-MediumItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-MediumItalic.ttf";
      sha256 = "cd6f53bf873fd5501b2582805d0bf1a9b46aca40f4cf8e01c6186f51881c1d9a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-SemiBold.ttf?raw=true";
      name = "BarlowSemiCondensed-SemiBold.ttf";
      sha256 = "bd299f4bc5b44d30be8d42e9bad3a5df7d66af1cd55d0ed72a8b8916360a1424";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-SemiBoldItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-SemiBoldItalic.ttf";
      sha256 = "8d06b9fba9eea0e4f4eddfc81af1f88781b0754e8648323de573e85040b59dda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Bold.ttf?raw=true";
      name = "BarlowSemiCondensed-Bold.ttf";
      sha256 = "5bd6757e459a110da81b44532f0f43058e2dab2401688abca84f2fdbde193cbb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-BoldItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-BoldItalic.ttf";
      sha256 = "65270ba022e056074b0b8f4a9e51a03b0df2e10d04700dcd0a792e524a87bced";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-ExtraBold.ttf?raw=true";
      name = "BarlowSemiCondensed-ExtraBold.ttf";
      sha256 = "a8096d0dc3ff22ea015d63f436a6856a69e402c12da9991f4a40f2c0bedf44ee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-ExtraBoldItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-ExtraBoldItalic.ttf";
      sha256 = "b9f5c879fa952b2b5356200a079b3f600f53d273c4dbc088585678d6c7456ae7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-Black.ttf?raw=true";
      name = "BarlowSemiCondensed-Black.ttf";
      sha256 = "171502596b584862a651426010f14878d8f7a87e6a080a621c0b1cd447a5fefc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89f5431ff0db41bd2fe3f7ba21a723a01622428b/ofl/barlowsemicondensed/BarlowSemiCondensed-BlackItalic.ttf?raw=true";
      name = "BarlowSemiCondensed-BlackItalic.ttf";
      sha256 = "30b873b860062acf2ad4c9dff24c0e7793ca9de26ec071a38c587534974865ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BarlowSemiCondensed-Thin.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Thin.ttf
     install -Dm644 BarlowSemiCondensed-ThinItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-ThinItalic.ttf
     install -Dm644 BarlowSemiCondensed-ExtraLight.ttf $out/share/fonts/truetype/BarlowSemiCondensed-ExtraLight.ttf
     install -Dm644 BarlowSemiCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-ExtraLightItalic.ttf
     install -Dm644 BarlowSemiCondensed-Light.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Light.ttf
     install -Dm644 BarlowSemiCondensed-LightItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-LightItalic.ttf
     install -Dm644 BarlowSemiCondensed-Regular.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Regular.ttf
     install -Dm644 BarlowSemiCondensed-Italic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Italic.ttf
     install -Dm644 BarlowSemiCondensed-Medium.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Medium.ttf
     install -Dm644 BarlowSemiCondensed-MediumItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-MediumItalic.ttf
     install -Dm644 BarlowSemiCondensed-SemiBold.ttf $out/share/fonts/truetype/BarlowSemiCondensed-SemiBold.ttf
     install -Dm644 BarlowSemiCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-SemiBoldItalic.ttf
     install -Dm644 BarlowSemiCondensed-Bold.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Bold.ttf
     install -Dm644 BarlowSemiCondensed-BoldItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-BoldItalic.ttf
     install -Dm644 BarlowSemiCondensed-ExtraBold.ttf $out/share/fonts/truetype/BarlowSemiCondensed-ExtraBold.ttf
     install -Dm644 BarlowSemiCondensed-ExtraBoldItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-ExtraBoldItalic.ttf
     install -Dm644 BarlowSemiCondensed-Black.ttf $out/share/fonts/truetype/BarlowSemiCondensed-Black.ttf
     install -Dm644 BarlowSemiCondensed-BlackItalic.ttf $out/share/fonts/truetype/BarlowSemiCondensed-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Barlow Semi Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
