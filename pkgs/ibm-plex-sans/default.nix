{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-${version}";
  version = "2019-02-15-013019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Thin.ttf?raw=true";
      name = "IBMPlexSans-Thin.ttf";
      sha256 = "36a00e5cff8102abd6011a65bfa93447c42aef3c69fcd19b0a64153af31c44e4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-ThinItalic.ttf?raw=true";
      name = "IBMPlexSans-ThinItalic.ttf";
      sha256 = "e59e1ff9a6c40c9940d31e11490697a5cf7c0d6f304ca1fe447f2ccc9ef574e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-ExtraLight.ttf?raw=true";
      name = "IBMPlexSans-ExtraLight.ttf";
      sha256 = "29c99a97ee62520c05414bcb2b1be59f2362455c541135806eb547535f013a1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSans-ExtraLightItalic.ttf";
      sha256 = "f1b8bef9d6a47f3061fc5b9ff1bf0140f28d0cbd1dc41a89c050ee8d5340003e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Light.ttf?raw=true";
      name = "IBMPlexSans-Light.ttf";
      sha256 = "39c31245ef812fe0efae0f61dbc457be6ad6a92f922d0726f982971f2774df88";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-LightItalic.ttf?raw=true";
      name = "IBMPlexSans-LightItalic.ttf";
      sha256 = "5417a2aeeb8666c679286195f9a5fc257c542bd90ea75a75d46cb1a6890b6a0f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Regular.ttf?raw=true";
      name = "IBMPlexSans-Regular.ttf";
      sha256 = "f1090ad34ee3187c3360cc2a5dfb0fa21441adb1c1a80408b161d290451aa891";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Italic.ttf?raw=true";
      name = "IBMPlexSans-Italic.ttf";
      sha256 = "7f02b9c2d4c82a8bdda02731c23c75eba4aaae602f5a05a64dde9e8bafb4b23d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Medium.ttf?raw=true";
      name = "IBMPlexSans-Medium.ttf";
      sha256 = "27ea9f08853fcf913d46aaeb4146849d508bb9bc2d646151bf44b718d15c4f8c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-MediumItalic.ttf?raw=true";
      name = "IBMPlexSans-MediumItalic.ttf";
      sha256 = "cdaaf34051f1fedc68afdcd0a1c6b8dc7624a6d32572842df251d629990c5ad6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-SemiBold.ttf?raw=true";
      name = "IBMPlexSans-SemiBold.ttf";
      sha256 = "b08037c049fb4ccf91aa8c772cc952301b714ba16c6be1c57f46c72e15c318f6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSans-SemiBoldItalic.ttf";
      sha256 = "f8555e9fdf1d8277ff7572a6c0abf10cac32e7a1fe25daac46d88c38cc702681";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-Bold.ttf?raw=true";
      name = "IBMPlexSans-Bold.ttf";
      sha256 = "e8a8b7a90dc55215be2d84c303278da48029542ad44f0599b9729a991a48296b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/115c6eb017ef7cdc035a3058bbc6336d9aa3d992/ofl/ibmplexsans/IBMPlexSans-BoldItalic.ttf?raw=true";
      name = "IBMPlexSans-BoldItalic.ttf";
      sha256 = "e35aa2a2beb41be59b423c6cd7e79ee27bc08f9fce79d65f99c1fe98d3cf4073";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSans-Thin.ttf $out/share/fonts/truetype/IBMPlexSans-Thin.ttf
     install -Dm644 IBMPlexSans-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSans-ThinItalic.ttf
     install -Dm644 IBMPlexSans-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSans-ExtraLight.ttf
     install -Dm644 IBMPlexSans-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSans-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSans-Light.ttf $out/share/fonts/truetype/IBMPlexSans-Light.ttf
     install -Dm644 IBMPlexSans-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSans-LightItalic.ttf
     install -Dm644 IBMPlexSans-Regular.ttf $out/share/fonts/truetype/IBMPlexSans-Regular.ttf
     install -Dm644 IBMPlexSans-Italic.ttf $out/share/fonts/truetype/IBMPlexSans-Italic.ttf
     install -Dm644 IBMPlexSans-Medium.ttf $out/share/fonts/truetype/IBMPlexSans-Medium.ttf
     install -Dm644 IBMPlexSans-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSans-MediumItalic.ttf
     install -Dm644 IBMPlexSans-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSans-SemiBold.ttf
     install -Dm644 IBMPlexSans-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSans-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSans-Bold.ttf $out/share/fonts/truetype/IBMPlexSans-Bold.ttf
     install -Dm644 IBMPlexSans-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSans-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "IBM Plex Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
