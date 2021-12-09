{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-serif-${version}";
  version = "2019-02-15-013019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Thin.ttf?raw=true";
      name = "IBMPlexSerif-Thin.ttf";
      sha256 = "c422b3f1f7f0da8db14a9d98c9d72411630e5fa5784d9deb6448539e453bcf72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-ThinItalic.ttf?raw=true";
      name = "IBMPlexSerif-ThinItalic.ttf";
      sha256 = "71d6dcdc63858404618039915a8ed513a48d9d9cb0cf4aaa2ebed2b6b5fb3807";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-ExtraLight.ttf?raw=true";
      name = "IBMPlexSerif-ExtraLight.ttf";
      sha256 = "2cf9b1299eefe9646f72ec11cca31c46ebfa30d0068188a8181fa25a05a6f115";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSerif-ExtraLightItalic.ttf";
      sha256 = "ab63114d14eeb1594eff947143bf29f73defa3d1124b31311781e3c0ea9cc3d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Light.ttf?raw=true";
      name = "IBMPlexSerif-Light.ttf";
      sha256 = "9c4ee4fff8fb0600818344ea3782f79bd3905e404c01fa0480783d4e24e10d1a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-LightItalic.ttf?raw=true";
      name = "IBMPlexSerif-LightItalic.ttf";
      sha256 = "2d9622f276af0ee2369a115b407f02a111590e423157d8803190a960f2d7af80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Regular.ttf?raw=true";
      name = "IBMPlexSerif-Regular.ttf";
      sha256 = "fe093039520374cd6046a44effa5ddabea2b3a367f3ff182e7015c3ed162cc88";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Italic.ttf?raw=true";
      name = "IBMPlexSerif-Italic.ttf";
      sha256 = "8d9941460acabd596c536fe11ec3dad37b2f2f440936a6fa8d8067c3538f7fca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Medium.ttf?raw=true";
      name = "IBMPlexSerif-Medium.ttf";
      sha256 = "047b751f60f05c313f6d2c4f7771e3aa0d7e8295f60751c78f56034bea6989a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-MediumItalic.ttf?raw=true";
      name = "IBMPlexSerif-MediumItalic.ttf";
      sha256 = "80b276f03bd684d91fd910053dcebb1dce9a0fad382469bcdd627f1e32b0a960";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-SemiBold.ttf?raw=true";
      name = "IBMPlexSerif-SemiBold.ttf";
      sha256 = "5e9c89e567c805c964631b2f86e5c1581e868a66acbb736674bac2d5dc808251";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSerif-SemiBoldItalic.ttf";
      sha256 = "0cb9c76bd794cdeade1b04d592d36989819fce6576a37f203a113cb3fddcd1b4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-Bold.ttf?raw=true";
      name = "IBMPlexSerif-Bold.ttf";
      sha256 = "e6e4966977bfc1223fa083aa9c28f22fd0e9bd90ba7bf126bbe2d07ae961a1d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexserif/IBMPlexSerif-BoldItalic.ttf?raw=true";
      name = "IBMPlexSerif-BoldItalic.ttf";
      sha256 = "17ad2daa5d39ebb6272c7ff8eeaff78f34c5018ba7bf383125fb2a21cb3f68f7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSerif-Thin.ttf $out/share/fonts/truetype/IBMPlexSerif-Thin.ttf
     install -Dm644 IBMPlexSerif-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-ThinItalic.ttf
     install -Dm644 IBMPlexSerif-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSerif-ExtraLight.ttf
     install -Dm644 IBMPlexSerif-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSerif-Light.ttf $out/share/fonts/truetype/IBMPlexSerif-Light.ttf
     install -Dm644 IBMPlexSerif-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-LightItalic.ttf
     install -Dm644 IBMPlexSerif-Regular.ttf $out/share/fonts/truetype/IBMPlexSerif-Regular.ttf
     install -Dm644 IBMPlexSerif-Italic.ttf $out/share/fonts/truetype/IBMPlexSerif-Italic.ttf
     install -Dm644 IBMPlexSerif-Medium.ttf $out/share/fonts/truetype/IBMPlexSerif-Medium.ttf
     install -Dm644 IBMPlexSerif-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-MediumItalic.ttf
     install -Dm644 IBMPlexSerif-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSerif-SemiBold.ttf
     install -Dm644 IBMPlexSerif-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSerif-Bold.ttf $out/share/fonts/truetype/IBMPlexSerif-Bold.ttf
     install -Dm644 IBMPlexSerif-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
