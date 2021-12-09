{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-sans-${version}";
  version = "2017-02-17-184209";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-ExtraLight.ttf?raw=true";
      name = "NunitoSans-ExtraLight.ttf";
      sha256 = "dcb4f2eff3ba416391af7850438aa186757b88e7127eb6b6d8e612172cf267fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-ExtraLightItalic.ttf?raw=true";
      name = "NunitoSans-ExtraLightItalic.ttf";
      sha256 = "0cc291e8e0643800e40d8105afeb4ba3ffe9a9998b395374c4126332544f2564";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-Light.ttf?raw=true";
      name = "NunitoSans-Light.ttf";
      sha256 = "f70778a0a7053180b69c4e7fe3e98bd7335399d34fafab5457ffdf0b6452d3e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-LightItalic.ttf?raw=true";
      name = "NunitoSans-LightItalic.ttf";
      sha256 = "f2087c57299bde57e96e31f0e45e4e2a0730c4978c8fcce5d9d92917177b264f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-Regular.ttf?raw=true";
      name = "NunitoSans-Regular.ttf";
      sha256 = "c4e48d0d8e7d7230341c3a8869258988a38f0081f362d254642f15ea89656b43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-Italic.ttf?raw=true";
      name = "NunitoSans-Italic.ttf";
      sha256 = "16cd557bd149984fc5ed826ebf305a82d0b3182285bace231ba0de238b5a3739";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-SemiBold.ttf?raw=true";
      name = "NunitoSans-SemiBold.ttf";
      sha256 = "bee93c8250ec1ec573844d954ce7f77dfa23c13bd9576d00b98741cf3a6906e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-SemiBoldItalic.ttf?raw=true";
      name = "NunitoSans-SemiBoldItalic.ttf";
      sha256 = "1e098307f0157034a6ca8c895653ee17088847e3b4d75d24a4bb618180b7ecb8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-Bold.ttf?raw=true";
      name = "NunitoSans-Bold.ttf";
      sha256 = "073150651606b45d5cec8797a5328997bb7aae97432cb4365aeb4f10ae7fc764";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-BoldItalic.ttf?raw=true";
      name = "NunitoSans-BoldItalic.ttf";
      sha256 = "c9a2353649a027c211c2fa4e1823294e1d9eea33326316789f46305129b3c6bb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-ExtraBold.ttf?raw=true";
      name = "NunitoSans-ExtraBold.ttf";
      sha256 = "156e578a4433ba7189d378f230736208364b835e9418780f96d4e9f5c945f030";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-ExtraBoldItalic.ttf?raw=true";
      name = "NunitoSans-ExtraBoldItalic.ttf";
      sha256 = "2dcb5f7d1299f24a26f07a42f2af7ebcafbe7918aff3146d52b947a14f13488d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-Black.ttf?raw=true";
      name = "NunitoSans-Black.ttf";
      sha256 = "e45d8748f19705818f8b682e4d7be359a4301cb1e1db13869ba3182faeed234f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acb29324dacd3c2b72bb3d70c1dc4c5150bd210c/ofl/nunitosans/NunitoSans-BlackItalic.ttf?raw=true";
      name = "NunitoSans-BlackItalic.ttf";
      sha256 = "82ba6e1f2bc57e8eba3a453ea4a1e64bdb0a616ab1690ae6ed973ae28a98f2f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NunitoSans-ExtraLight.ttf $out/share/fonts/truetype/NunitoSans-ExtraLight.ttf
     install -Dm644 NunitoSans-ExtraLightItalic.ttf $out/share/fonts/truetype/NunitoSans-ExtraLightItalic.ttf
     install -Dm644 NunitoSans-Light.ttf $out/share/fonts/truetype/NunitoSans-Light.ttf
     install -Dm644 NunitoSans-LightItalic.ttf $out/share/fonts/truetype/NunitoSans-LightItalic.ttf
     install -Dm644 NunitoSans-Regular.ttf $out/share/fonts/truetype/NunitoSans-Regular.ttf
     install -Dm644 NunitoSans-Italic.ttf $out/share/fonts/truetype/NunitoSans-Italic.ttf
     install -Dm644 NunitoSans-SemiBold.ttf $out/share/fonts/truetype/NunitoSans-SemiBold.ttf
     install -Dm644 NunitoSans-SemiBoldItalic.ttf $out/share/fonts/truetype/NunitoSans-SemiBoldItalic.ttf
     install -Dm644 NunitoSans-Bold.ttf $out/share/fonts/truetype/NunitoSans-Bold.ttf
     install -Dm644 NunitoSans-BoldItalic.ttf $out/share/fonts/truetype/NunitoSans-BoldItalic.ttf
     install -Dm644 NunitoSans-ExtraBold.ttf $out/share/fonts/truetype/NunitoSans-ExtraBold.ttf
     install -Dm644 NunitoSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/NunitoSans-ExtraBoldItalic.ttf
     install -Dm644 NunitoSans-Black.ttf $out/share/fonts/truetype/NunitoSans-Black.ttf
     install -Dm644 NunitoSans-BlackItalic.ttf $out/share/fonts/truetype/NunitoSans-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Nunito Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
