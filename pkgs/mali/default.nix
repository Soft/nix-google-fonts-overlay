{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mali-${version}";
  version = "2018-09-07-135522";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-ExtraLight.ttf?raw=true";
      name = "Mali-ExtraLight.ttf";
      sha256 = "1ee5ea883fde78e4ec8b66ba3606348cd48171cc42072090df8f7500a82e3f33";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-ExtraLightItalic.ttf?raw=true";
      name = "Mali-ExtraLightItalic.ttf";
      sha256 = "0295ac94b941c9ee00997aaf83459f100a99986b3f4e2f2c19d211961e3986b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-Light.ttf?raw=true";
      name = "Mali-Light.ttf";
      sha256 = "0cd365c361b4a394583746ae222b136ca627b344a35cf84c6a65c2cf4ba7a97c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-LightItalic.ttf?raw=true";
      name = "Mali-LightItalic.ttf";
      sha256 = "47e58abc37bbd0279d2e349956a529a069fc08866b2cdb97e17131aeb05d39a3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-Regular.ttf?raw=true";
      name = "Mali-Regular.ttf";
      sha256 = "e3212f0f9be130743d32a4f174b7d79628daa5db0d72ca4c63c799ae465597bb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-Italic.ttf?raw=true";
      name = "Mali-Italic.ttf";
      sha256 = "feb2808bbd3827949b5eda93179d5820b0fbbb2bfd6154866b0d05e1b8f25f8c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-Medium.ttf?raw=true";
      name = "Mali-Medium.ttf";
      sha256 = "aa3320845e281de05d7076aed9be5a09df4bf11e6c46165027a0b57a0c8f5dc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-MediumItalic.ttf?raw=true";
      name = "Mali-MediumItalic.ttf";
      sha256 = "2c37d78ccf7e6095526f13ee020c7e48c15e91cf42a8b115a22467ff68fc2eca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-SemiBold.ttf?raw=true";
      name = "Mali-SemiBold.ttf";
      sha256 = "0ba6d92b46369ec5040d119f87a17586be96364fac743fbf510b54a3ead1adcc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-SemiBoldItalic.ttf?raw=true";
      name = "Mali-SemiBoldItalic.ttf";
      sha256 = "3a83a53f2b88e8464a09f8788cd4ad4e96ae3008e3bb2128de34693bd2ad6ed1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-Bold.ttf?raw=true";
      name = "Mali-Bold.ttf";
      sha256 = "3e2f421036c3f91eb5ef34650a5cd2116c737a542147769437a9856a455d4462";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fbdd512151630cf7f45b291cc2c5f3df8b23b720/ofl/mali/Mali-BoldItalic.ttf?raw=true";
      name = "Mali-BoldItalic.ttf";
      sha256 = "ed51d1fa721e4dc4a43dba34926442a007f8a300543c1171887810a547e5b23b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mali-ExtraLight.ttf $out/share/fonts/truetype/Mali-ExtraLight.ttf
     install -Dm644 Mali-ExtraLightItalic.ttf $out/share/fonts/truetype/Mali-ExtraLightItalic.ttf
     install -Dm644 Mali-Light.ttf $out/share/fonts/truetype/Mali-Light.ttf
     install -Dm644 Mali-LightItalic.ttf $out/share/fonts/truetype/Mali-LightItalic.ttf
     install -Dm644 Mali-Regular.ttf $out/share/fonts/truetype/Mali-Regular.ttf
     install -Dm644 Mali-Italic.ttf $out/share/fonts/truetype/Mali-Italic.ttf
     install -Dm644 Mali-Medium.ttf $out/share/fonts/truetype/Mali-Medium.ttf
     install -Dm644 Mali-MediumItalic.ttf $out/share/fonts/truetype/Mali-MediumItalic.ttf
     install -Dm644 Mali-SemiBold.ttf $out/share/fonts/truetype/Mali-SemiBold.ttf
     install -Dm644 Mali-SemiBoldItalic.ttf $out/share/fonts/truetype/Mali-SemiBoldItalic.ttf
     install -Dm644 Mali-Bold.ttf $out/share/fonts/truetype/Mali-Bold.ttf
     install -Dm644 Mali-BoldItalic.ttf $out/share/fonts/truetype/Mali-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Mali";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
