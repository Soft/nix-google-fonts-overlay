{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merriweather-sans-${version}";
  version = "2016-05-26-000711";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-Light.ttf?raw=true";
      name = "MerriweatherSans-Light.ttf";
      sha256 = "296f4c55d4df693b2ee8240184b2d8ff655c5f32944597f7733965dc76840d40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-LightItalic.ttf?raw=true";
      name = "MerriweatherSans-LightItalic.ttf";
      sha256 = "ff3b59fa8aca71e75e9aa329bf1e67bcf2fb4f5fa23edefba010c024941229f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-Regular.ttf?raw=true";
      name = "MerriweatherSans-Regular.ttf";
      sha256 = "d8ca7e8e39b7e486d7545a0bbefdfe08dfd9b2ddaa672be07f48b16c46dbc24b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-Italic.ttf?raw=true";
      name = "MerriweatherSans-Italic.ttf";
      sha256 = "9ff9310de27fbcfeabd976f6925f75f4e67ba8afb31c9d76ccad4070ed383e98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-Bold.ttf?raw=true";
      name = "MerriweatherSans-Bold.ttf";
      sha256 = "9b17d0769b7f16eae06168007dfe129ca1be4e582d972949103daf9be393ba87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-BoldItalic.ttf?raw=true";
      name = "MerriweatherSans-BoldItalic.ttf";
      sha256 = "dc40cb2fb6d2e7d775cf63af674f137c74160d1de8af55d942192381a8eb7d2e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-ExtraBold.ttf?raw=true";
      name = "MerriweatherSans-ExtraBold.ttf";
      sha256 = "b3c4697d84a65397d98657ce2e934aa1dd0f9187776525b61ebf05e2779d4fef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8c7a8625003873685e54dced6bc1f09b7661fdc/ofl/merriweathersans/MerriweatherSans-ExtraBoldItalic.ttf?raw=true";
      name = "MerriweatherSans-ExtraBoldItalic.ttf";
      sha256 = "f60fcb67bc5d4c5c087523c91c90303f1463790b34924942f8af02d2238be21b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MerriweatherSans-Light.ttf $out/share/fonts/truetype/MerriweatherSans-Light.ttf
     install -Dm644 MerriweatherSans-LightItalic.ttf $out/share/fonts/truetype/MerriweatherSans-LightItalic.ttf
     install -Dm644 MerriweatherSans-Regular.ttf $out/share/fonts/truetype/MerriweatherSans-Regular.ttf
     install -Dm644 MerriweatherSans-Italic.ttf $out/share/fonts/truetype/MerriweatherSans-Italic.ttf
     install -Dm644 MerriweatherSans-Bold.ttf $out/share/fonts/truetype/MerriweatherSans-Bold.ttf
     install -Dm644 MerriweatherSans-BoldItalic.ttf $out/share/fonts/truetype/MerriweatherSans-BoldItalic.ttf
     install -Dm644 MerriweatherSans-ExtraBold.ttf $out/share/fonts/truetype/MerriweatherSans-ExtraBold.ttf
     install -Dm644 MerriweatherSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/MerriweatherSans-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Merriweather Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
