{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-condensed-${version}";
  version = "2019-02-15-013019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Thin.ttf?raw=true";
      name = "IBMPlexSansCondensed-Thin.ttf";
      sha256 = "ed36a3d6c954f39c47379cbe36aef9827f35b7a170c194938d33563be55c644f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ThinItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-ThinItalic.ttf";
      sha256 = "008f16d94c45dbcb4de8bb9dd121eb9808f30ba7da2f2fc03cb1628189db1c4c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansCondensed-ExtraLight.ttf";
      sha256 = "12bc377e762eae9444046535ffb833589b6b5383daa2daeab8677032e0752d42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-ExtraLightItalic.ttf";
      sha256 = "288169d381d545b40b0b0fac47ba4b1a5116c9366a9fef9b6d5c0c88642894f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Light.ttf?raw=true";
      name = "IBMPlexSansCondensed-Light.ttf";
      sha256 = "1a37f73605b405cecd9a0d409656d69cebfae34581e80b26d6f437dd880e9748";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-LightItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-LightItalic.ttf";
      sha256 = "dabdf3218151b3939e37594bcf76f9c3ed2eba2ecde2d624c4cddff1df8d10db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Regular.ttf?raw=true";
      name = "IBMPlexSansCondensed-Regular.ttf";
      sha256 = "61cbf6bc6ef91586f651f120df7e7ca1d55d02b58c1b89f84b069928689fa0f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Italic.ttf?raw=true";
      name = "IBMPlexSansCondensed-Italic.ttf";
      sha256 = "a55fb424e1fd366fdb76e3b2f075ef00ca4400b7875e5fe0c1d34b16ec35164e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Medium.ttf?raw=true";
      name = "IBMPlexSansCondensed-Medium.ttf";
      sha256 = "05b17e0126d2b7eef7c11f4360d2557516c38dc12ed08180cc06313de6978956";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-MediumItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-MediumItalic.ttf";
      sha256 = "9f0d3d2bf0db00f04072206d66e53f8b75589be5be1400a2b0bc1cb63e687a59";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-SemiBold.ttf?raw=true";
      name = "IBMPlexSansCondensed-SemiBold.ttf";
      sha256 = "579f39020157906dffd040f90507923d939129038988471e4bfe613dcc8100ab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-SemiBoldItalic.ttf";
      sha256 = "80b6c020ade0b66e397280da5b9426402c7efd68472f7c6bbfa230eed902e033";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Bold.ttf?raw=true";
      name = "IBMPlexSansCondensed-Bold.ttf";
      sha256 = "ad0a436bf04daafcb7a1f5e04701f2441d4dbc326eab5014f6b4579323ffe565";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-BoldItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-BoldItalic.ttf";
      sha256 = "e806dd055761adfd1bb2e198b9c86d2e3811d761f8cd22b06fc2f50acabcad3b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansCondensed-Thin.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Thin.ttf
     install -Dm644 IBMPlexSansCondensed-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ThinItalic.ttf
     install -Dm644 IBMPlexSansCondensed-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ExtraLight.ttf
     install -Dm644 IBMPlexSansCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Light.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Light.ttf
     install -Dm644 IBMPlexSansCondensed-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-LightItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Regular.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Regular.ttf
     install -Dm644 IBMPlexSansCondensed-Italic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Italic.ttf
     install -Dm644 IBMPlexSansCondensed-Medium.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Medium.ttf
     install -Dm644 IBMPlexSansCondensed-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-MediumItalic.ttf
     install -Dm644 IBMPlexSansCondensed-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-SemiBold.ttf
     install -Dm644 IBMPlexSansCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Bold.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Bold.ttf
     install -Dm644 IBMPlexSansCondensed-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
