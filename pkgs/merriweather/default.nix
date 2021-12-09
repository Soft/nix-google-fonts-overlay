{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merriweather-${version}";
  version = "2017-10-31-191616";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-Light.ttf?raw=true";
      name = "Merriweather-Light.ttf";
      sha256 = "d3ecc46bab128ed073ad9189bd7efdd2df455d8942ec056f14129bf35bcea7e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-LightItalic.ttf?raw=true";
      name = "Merriweather-LightItalic.ttf";
      sha256 = "8521c8eb542adf178b19c7ab7a0210fb4715fe68bb6ea578be129277b642c1f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-Regular.ttf?raw=true";
      name = "Merriweather-Regular.ttf";
      sha256 = "bc38fe756b3e259248183fc0b75ad81b02774f3ca68e5e544e925827b0186d40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-Italic.ttf?raw=true";
      name = "Merriweather-Italic.ttf";
      sha256 = "fc80dbac0ca9da894ae1801df9abe58f6dcca179ec4f8f6f7ea80fd13a1d387d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-Bold.ttf?raw=true";
      name = "Merriweather-Bold.ttf";
      sha256 = "55139769a87085bff777f68e3ecf92450c21a04c5ddd1e9e9528960ba4088c9f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-BoldItalic.ttf?raw=true";
      name = "Merriweather-BoldItalic.ttf";
      sha256 = "403b1bece3d70420e65c670315693e9bca255e9c95884d9cb2b334838e67b509";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-Black.ttf?raw=true";
      name = "Merriweather-Black.ttf";
      sha256 = "dff1048499a2c245713dfa41e3683cfecfd15df757cc4cb20f85bceba7bfd58b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b848f42f0bc0a8bc53588c3688ca37890e1db0bd/ofl/merriweather/Merriweather-BlackItalic.ttf?raw=true";
      name = "Merriweather-BlackItalic.ttf";
      sha256 = "42b5cdd80b293acb1d7a15958a2c2f8b6b95213709110777486763c75bc83ebf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Merriweather-Light.ttf $out/share/fonts/truetype/Merriweather-Light.ttf
     install -Dm644 Merriweather-LightItalic.ttf $out/share/fonts/truetype/Merriweather-LightItalic.ttf
     install -Dm644 Merriweather-Regular.ttf $out/share/fonts/truetype/Merriweather-Regular.ttf
     install -Dm644 Merriweather-Italic.ttf $out/share/fonts/truetype/Merriweather-Italic.ttf
     install -Dm644 Merriweather-Bold.ttf $out/share/fonts/truetype/Merriweather-Bold.ttf
     install -Dm644 Merriweather-BoldItalic.ttf $out/share/fonts/truetype/Merriweather-BoldItalic.ttf
     install -Dm644 Merriweather-Black.ttf $out/share/fonts/truetype/Merriweather-Black.ttf
     install -Dm644 Merriweather-BlackItalic.ttf $out/share/fonts/truetype/Merriweather-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Merriweather";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
