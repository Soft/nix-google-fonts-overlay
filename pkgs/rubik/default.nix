{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-${version}";
  version = "2017-08-07-182337";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Light.ttf?raw=true";
      name = "Rubik-Light.ttf";
      sha256 = "3f44aa6788818d16705aed81aec94e6bc14b96e67aa18814e5aee94c0f09b9dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-LightItalic.ttf?raw=true";
      name = "Rubik-LightItalic.ttf";
      sha256 = "85f0cb7ac67eac45d6d668b970a4c031760728fba5de382efb301e1bd2acd37f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Regular.ttf?raw=true";
      name = "Rubik-Regular.ttf";
      sha256 = "f55c58732deafb1be99e4798aa290e71711af0d5d259dc42508fc71404f03b13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Italic.ttf?raw=true";
      name = "Rubik-Italic.ttf";
      sha256 = "c4ed44c40e19e82ac28d4ac1af3858281cb3f86683eb01ddd4a5f46129a3a33f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Medium.ttf?raw=true";
      name = "Rubik-Medium.ttf";
      sha256 = "f11e9430edf6810d3bf5c2de513895359ce7c057bd3a512be51f499505b531a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-MediumItalic.ttf?raw=true";
      name = "Rubik-MediumItalic.ttf";
      sha256 = "79a8ccbf9dd6c54dcf117e401e7a0fdb7b6f59c6bc67d0976b0aeed322fd63f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Bold.ttf?raw=true";
      name = "Rubik-Bold.ttf";
      sha256 = "0b74530cc83e9131e6c66fd9222c18d6c9c484d6833210fbee018d78339f98d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-BoldItalic.ttf?raw=true";
      name = "Rubik-BoldItalic.ttf";
      sha256 = "fc59adad1024349344607fc6465cbd1049fe3db90d0406a883d9a29b1228032e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-Black.ttf?raw=true";
      name = "Rubik-Black.ttf";
      sha256 = "dbbeda372296cce1c2309996e70d435ed0a92ff24ec2f66dc3319da85216d4c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dfd435109b718b1c5a8da7bd0872c751e2ae1820/ofl/rubik/Rubik-BlackItalic.ttf?raw=true";
      name = "Rubik-BlackItalic.ttf";
      sha256 = "3edb8d4fcc271f11d2f118f58cd772fac62cd4e4449e4b5091b7fca9c9379fec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rubik-Light.ttf $out/share/fonts/truetype/Rubik-Light.ttf
     install -Dm644 Rubik-LightItalic.ttf $out/share/fonts/truetype/Rubik-LightItalic.ttf
     install -Dm644 Rubik-Regular.ttf $out/share/fonts/truetype/Rubik-Regular.ttf
     install -Dm644 Rubik-Italic.ttf $out/share/fonts/truetype/Rubik-Italic.ttf
     install -Dm644 Rubik-Medium.ttf $out/share/fonts/truetype/Rubik-Medium.ttf
     install -Dm644 Rubik-MediumItalic.ttf $out/share/fonts/truetype/Rubik-MediumItalic.ttf
     install -Dm644 Rubik-Bold.ttf $out/share/fonts/truetype/Rubik-Bold.ttf
     install -Dm644 Rubik-BoldItalic.ttf $out/share/fonts/truetype/Rubik-BoldItalic.ttf
     install -Dm644 Rubik-Black.ttf $out/share/fonts/truetype/Rubik-Black.ttf
     install -Dm644 Rubik-BlackItalic.ttf $out/share/fonts/truetype/Rubik-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Rubik";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
