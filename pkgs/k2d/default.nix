{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "k2d-${version}";
  version = "2018-09-07-135641";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Thin.ttf?raw=true";
      name = "K2D-Thin.ttf";
      sha256 = "33ca61459477f91ac726e551eb9ecb4d470af41afc33ddcb5cc1a985e4869adb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-ThinItalic.ttf?raw=true";
      name = "K2D-ThinItalic.ttf";
      sha256 = "c1813a64b87902729d730f57a3bb920727abf8b1e25a35610f9e213b237b5791";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-ExtraLight.ttf?raw=true";
      name = "K2D-ExtraLight.ttf";
      sha256 = "3b3c724b0ae259e1b163e9f4451f6c25903b13f3a2049ea73bea7f635d171dc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-ExtraLightItalic.ttf?raw=true";
      name = "K2D-ExtraLightItalic.ttf";
      sha256 = "ce3a2cb01a913733de2d85159cd1b757c766fa79a0266363f1c60b489e3fb2e9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Light.ttf?raw=true";
      name = "K2D-Light.ttf";
      sha256 = "f69664fb42121ad85555822d821bfd6ccde64f201984d5b688c22f300a1efb3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-LightItalic.ttf?raw=true";
      name = "K2D-LightItalic.ttf";
      sha256 = "56d2f1171dc62770c3668964f231562fae0d882914609133fca914cd82bea203";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Regular.ttf?raw=true";
      name = "K2D-Regular.ttf";
      sha256 = "bfab1193b93b9200455119c968f0ccac24b68d2408d26a8123a4c3c01fb11821";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Italic.ttf?raw=true";
      name = "K2D-Italic.ttf";
      sha256 = "e423a6554e790cefa6841af2ee34837465f9313fd5e6a1074f9b795d7073b504";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Medium.ttf?raw=true";
      name = "K2D-Medium.ttf";
      sha256 = "0ea9a92a4d005f69a6cf53b1eaed244f70817a477dcd66bc06fef1f4d9821795";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-MediumItalic.ttf?raw=true";
      name = "K2D-MediumItalic.ttf";
      sha256 = "29cda60bfda134132fdc72cb02a74604ffe9120cba1f038ed2522edfe210bc5c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-SemiBold.ttf?raw=true";
      name = "K2D-SemiBold.ttf";
      sha256 = "7d6225a49110e9981d24bbccaf06ae5774b641297edef16ffa2b372497840d07";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-SemiBoldItalic.ttf?raw=true";
      name = "K2D-SemiBoldItalic.ttf";
      sha256 = "57d890588743f161b1644ffffc18907c49115b64cd32d2e9bcc5f6f0c99326ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-Bold.ttf?raw=true";
      name = "K2D-Bold.ttf";
      sha256 = "0876882908abb4ee3bcf9f73007128dddd52b77fe36414101fb12da0a67edb3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-BoldItalic.ttf?raw=true";
      name = "K2D-BoldItalic.ttf";
      sha256 = "6128b62d3da6a8dfdbba554a74538afce7bbe08e9881108596f8efa8485e7d78";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-ExtraBold.ttf?raw=true";
      name = "K2D-ExtraBold.ttf";
      sha256 = "46aa84ed5ffa8f7c1e156ddff85441ebbc1913b8aa3349bf3cd722e7b97df761";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e638b5dfabca10f2cf8a4c7b9f4c61b3cf592a68/ofl/k2d/K2D-ExtraBoldItalic.ttf?raw=true";
      name = "K2D-ExtraBoldItalic.ttf";
      sha256 = "fb0c965d96921d852426426709344dacdd8107d2f405513a092601b0077b4e89";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 K2D-Thin.ttf $out/share/fonts/truetype/K2D-Thin.ttf
     install -Dm644 K2D-ThinItalic.ttf $out/share/fonts/truetype/K2D-ThinItalic.ttf
     install -Dm644 K2D-ExtraLight.ttf $out/share/fonts/truetype/K2D-ExtraLight.ttf
     install -Dm644 K2D-ExtraLightItalic.ttf $out/share/fonts/truetype/K2D-ExtraLightItalic.ttf
     install -Dm644 K2D-Light.ttf $out/share/fonts/truetype/K2D-Light.ttf
     install -Dm644 K2D-LightItalic.ttf $out/share/fonts/truetype/K2D-LightItalic.ttf
     install -Dm644 K2D-Regular.ttf $out/share/fonts/truetype/K2D-Regular.ttf
     install -Dm644 K2D-Italic.ttf $out/share/fonts/truetype/K2D-Italic.ttf
     install -Dm644 K2D-Medium.ttf $out/share/fonts/truetype/K2D-Medium.ttf
     install -Dm644 K2D-MediumItalic.ttf $out/share/fonts/truetype/K2D-MediumItalic.ttf
     install -Dm644 K2D-SemiBold.ttf $out/share/fonts/truetype/K2D-SemiBold.ttf
     install -Dm644 K2D-SemiBoldItalic.ttf $out/share/fonts/truetype/K2D-SemiBoldItalic.ttf
     install -Dm644 K2D-Bold.ttf $out/share/fonts/truetype/K2D-Bold.ttf
     install -Dm644 K2D-BoldItalic.ttf $out/share/fonts/truetype/K2D-BoldItalic.ttf
     install -Dm644 K2D-ExtraBold.ttf $out/share/fonts/truetype/K2D-ExtraBold.ttf
     install -Dm644 K2D-ExtraBoldItalic.ttf $out/share/fonts/truetype/K2D-ExtraBoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "K2D";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
