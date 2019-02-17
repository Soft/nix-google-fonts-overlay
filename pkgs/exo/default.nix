{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exo-${version}";
  version = "2018-09-12-083600";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Thin.ttf?raw=true";
      name = "Exo-Thin.ttf";
      sha256 = "b7562d45be0adc126ac496c2765a79c5d653a964167968127afc020aa9d9a147";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-ThinItalic.ttf?raw=true";
      name = "Exo-ThinItalic.ttf";
      sha256 = "8e6bddf4be7da0b80624295acd9d21349e97c9992009ae3e013419657eb994b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-ExtraLight.ttf?raw=true";
      name = "Exo-ExtraLight.ttf";
      sha256 = "3878f7be633c915612ba13f646b4ff20784b732a473ebd735cb6c303afe54118";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-ExtraLightItalic.ttf?raw=true";
      name = "Exo-ExtraLightItalic.ttf";
      sha256 = "7cd0ba05d61a5973060109ffe3fcb697bc9032445aae424e2f14386dee448ebe";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Light.ttf?raw=true";
      name = "Exo-Light.ttf";
      sha256 = "58a25a4309e1d70ed237f94a9e5e716a064890fa7a82a976932323655380a47e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-LightItalic.ttf?raw=true";
      name = "Exo-LightItalic.ttf";
      sha256 = "df04c887506fbf068e717bf09a41c84c0678b3698adb5ae734ff8b41cf8911b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Regular.ttf?raw=true";
      name = "Exo-Regular.ttf";
      sha256 = "75e418c2149b07687890a1e881c8a9251332c580e063eeae506cd5d9bf649768";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Italic.ttf?raw=true";
      name = "Exo-Italic.ttf";
      sha256 = "a859892ce92aae611c98f00be73e149069ccadb868c75bb84de4722774d0250a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Medium.ttf?raw=true";
      name = "Exo-Medium.ttf";
      sha256 = "d64d185ac313a0b4c6d53b74b6b0ce0dadfe8ae1198ca83a347d6ddcc8462d23";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-MediumItalic.ttf?raw=true";
      name = "Exo-MediumItalic.ttf";
      sha256 = "ba5dc0b4bdd717758b51c55eeeeb96c5d40cd4e43bdb42a435ab4d41a962bc45";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-SemiBold.ttf?raw=true";
      name = "Exo-SemiBold.ttf";
      sha256 = "80917106da127fecc7ebb7f8df18289c3305c9360965d3eeac875988601f9538";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-SemiBoldItalic.ttf?raw=true";
      name = "Exo-SemiBoldItalic.ttf";
      sha256 = "7780c2f0be3189db3863185d4d79c9fa8f652336e3726348e88add37b421594e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Bold.ttf?raw=true";
      name = "Exo-Bold.ttf";
      sha256 = "623cf624291c9d6604db826c8a742d58092f08c7d00e6e0ddf220ed42fd66bb5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-BoldItalic.ttf?raw=true";
      name = "Exo-BoldItalic.ttf";
      sha256 = "338d26292445f262a0aa75a9bfd33d98a550aacae753b7457fb26b58d19cfbd5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-ExtraBold.ttf?raw=true";
      name = "Exo-ExtraBold.ttf";
      sha256 = "77bfd04fdbc3602e440d56b05cb9d045bf971c44d735755c514818c5da647706";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-ExtraBoldItalic.ttf?raw=true";
      name = "Exo-ExtraBoldItalic.ttf";
      sha256 = "d124e54bb4ab2ddd1e59165ca14da9bf9cf4858b3e60bba311169cd7c3b8c4e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-Black.ttf?raw=true";
      name = "Exo-Black.ttf";
      sha256 = "691d14e2d8ca4b6a56bb5751fae31c23e44ecae86e6c7154da06d85335cd48c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7e288cf7b8719686a310fd6b4b5dd21c4d520ed3/ofl/exo/Exo-BlackItalic.ttf?raw=true";
      name = "Exo-BlackItalic.ttf";
      sha256 = "451e8201f0f5812325261729d1a1fdc820b7c8849266968fa1c879c1e00f3057";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exo-Thin.ttf $out/share/fonts/truetype/Exo-Thin.ttf
     install -Dm644 Exo-ThinItalic.ttf $out/share/fonts/truetype/Exo-ThinItalic.ttf
     install -Dm644 Exo-ExtraLight.ttf $out/share/fonts/truetype/Exo-ExtraLight.ttf
     install -Dm644 Exo-ExtraLightItalic.ttf $out/share/fonts/truetype/Exo-ExtraLightItalic.ttf
     install -Dm644 Exo-Light.ttf $out/share/fonts/truetype/Exo-Light.ttf
     install -Dm644 Exo-LightItalic.ttf $out/share/fonts/truetype/Exo-LightItalic.ttf
     install -Dm644 Exo-Regular.ttf $out/share/fonts/truetype/Exo-Regular.ttf
     install -Dm644 Exo-Italic.ttf $out/share/fonts/truetype/Exo-Italic.ttf
     install -Dm644 Exo-Medium.ttf $out/share/fonts/truetype/Exo-Medium.ttf
     install -Dm644 Exo-MediumItalic.ttf $out/share/fonts/truetype/Exo-MediumItalic.ttf
     install -Dm644 Exo-SemiBold.ttf $out/share/fonts/truetype/Exo-SemiBold.ttf
     install -Dm644 Exo-SemiBoldItalic.ttf $out/share/fonts/truetype/Exo-SemiBoldItalic.ttf
     install -Dm644 Exo-Bold.ttf $out/share/fonts/truetype/Exo-Bold.ttf
     install -Dm644 Exo-BoldItalic.ttf $out/share/fonts/truetype/Exo-BoldItalic.ttf
     install -Dm644 Exo-ExtraBold.ttf $out/share/fonts/truetype/Exo-ExtraBold.ttf
     install -Dm644 Exo-ExtraBoldItalic.ttf $out/share/fonts/truetype/Exo-ExtraBoldItalic.ttf
     install -Dm644 Exo-Black.ttf $out/share/fonts/truetype/Exo-Black.ttf
     install -Dm644 Exo-BlackItalic.ttf $out/share/fonts/truetype/Exo-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Exo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
