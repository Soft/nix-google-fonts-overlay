{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palanquin-${version}";
  version = "2017-05-09-184810";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-Thin.ttf?raw=true";
      name = "Palanquin-Thin.ttf";
      sha256 = "3c18a02e7351dd1dbffad4b464af34e29d527f6792291fe4dff6ae6a60e79300";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-ExtraLight.ttf?raw=true";
      name = "Palanquin-ExtraLight.ttf";
      sha256 = "e9775ee9567cef73228b5a74edb3e5a31cd4a72a8ad0ad8228914b7245f3f491";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-Light.ttf?raw=true";
      name = "Palanquin-Light.ttf";
      sha256 = "7bf50ebb14ccf02c1dff2cd0a087a405df838e1d105699856c82a30444e24623";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-Regular.ttf?raw=true";
      name = "Palanquin-Regular.ttf";
      sha256 = "c29452dcfedcd99f4f1012cfc0513664c4336b41ddc32db48f422088391e1bf3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-Medium.ttf?raw=true";
      name = "Palanquin-Medium.ttf";
      sha256 = "71a2ba8b3ee619d6e0f84a9a73fd538a45051af476c94e42b1e0a2925d5664ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-SemiBold.ttf?raw=true";
      name = "Palanquin-SemiBold.ttf";
      sha256 = "5b60a5f849d09649f0b75f8432fae67f7e1a43fbb65061a4b3f449cd9eafc8a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2849d0c1ff37324e8436607411cbd319a44fb92/ofl/palanquin/Palanquin-Bold.ttf?raw=true";
      name = "Palanquin-Bold.ttf";
      sha256 = "2a8745a17bbc04a04f35f4d25b31bfc25a74b903fe994c047403600954b70c80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Palanquin-Thin.ttf $out/share/fonts/truetype/Palanquin-Thin.ttf
     install -Dm644 Palanquin-ExtraLight.ttf $out/share/fonts/truetype/Palanquin-ExtraLight.ttf
     install -Dm644 Palanquin-Light.ttf $out/share/fonts/truetype/Palanquin-Light.ttf
     install -Dm644 Palanquin-Regular.ttf $out/share/fonts/truetype/Palanquin-Regular.ttf
     install -Dm644 Palanquin-Medium.ttf $out/share/fonts/truetype/Palanquin-Medium.ttf
     install -Dm644 Palanquin-SemiBold.ttf $out/share/fonts/truetype/Palanquin-SemiBold.ttf
     install -Dm644 Palanquin-Bold.ttf $out/share/fonts/truetype/Palanquin-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Palanquin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
