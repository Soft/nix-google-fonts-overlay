{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fira-sans-condensed-${version}";
  version = "2016-12-02-170228";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Thin.ttf?raw=true";
      name = "FiraSansCondensed-Thin.ttf";
      sha256 = "0b43c691f9a89fe8d06c34584ff9ee697530084403b8590d34594d8a36644fd1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-ThinItalic.ttf?raw=true";
      name = "FiraSansCondensed-ThinItalic.ttf";
      sha256 = "507b859151c70c7a0383c535b6bfd3649720823f4aa9c9c0718a175a75567025";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-ExtraLight.ttf?raw=true";
      name = "FiraSansCondensed-ExtraLight.ttf";
      sha256 = "accb6e5b63bcb4abb117f430d516ffb67e3edc164f4119f8a926703e08f2e9d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-ExtraLightItalic.ttf?raw=true";
      name = "FiraSansCondensed-ExtraLightItalic.ttf";
      sha256 = "43402ba23f72d0bc54b1583eddbdd23b54d367abe979858db8f9398e385dd923";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Light.ttf?raw=true";
      name = "FiraSansCondensed-Light.ttf";
      sha256 = "1fdefd76fb773e95d1120db6bc20c576feac1e964da28e28eb4342c8e7730cda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-LightItalic.ttf?raw=true";
      name = "FiraSansCondensed-LightItalic.ttf";
      sha256 = "602d1e0b961b2efc0da84d00ea334c0f6fe501912e7965b6ed482c62a6406d3f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Regular.ttf?raw=true";
      name = "FiraSansCondensed-Regular.ttf";
      sha256 = "c67609f14fc9d328442bfffcc31988b0f76e5575cf460fcc1f3dd8e4912fe257";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Italic.ttf?raw=true";
      name = "FiraSansCondensed-Italic.ttf";
      sha256 = "57f3b2cfbb07698b9699e613369d33e06b61b827586b63341deaa6c573d264e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Medium.ttf?raw=true";
      name = "FiraSansCondensed-Medium.ttf";
      sha256 = "6385967fe921a6ee837221cde461e695e77f8931a3ca4bc82c7c1c1a5fe47f86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-MediumItalic.ttf?raw=true";
      name = "FiraSansCondensed-MediumItalic.ttf";
      sha256 = "d7de5f62e405f9587f614fde8fb5ae8dfb0511f37b27bec3f8067e9adbc665cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-SemiBold.ttf?raw=true";
      name = "FiraSansCondensed-SemiBold.ttf";
      sha256 = "5a9586bc549d557c415a6a3dc88658b1453d1df661edf811954ebd55776c01cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-SemiBoldItalic.ttf?raw=true";
      name = "FiraSansCondensed-SemiBoldItalic.ttf";
      sha256 = "c4f1d1373f1ce1f5219bdc6ff9bf964698ce0bdc9d2f66e0df53741f3f4c0be9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Bold.ttf?raw=true";
      name = "FiraSansCondensed-Bold.ttf";
      sha256 = "b9371052e58ec5b709153dd0fffc60b5205b4d3435cf957c2522705b31b0dbcc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-BoldItalic.ttf?raw=true";
      name = "FiraSansCondensed-BoldItalic.ttf";
      sha256 = "aebe32d2d821890e0d66443ca2dc59b237ff34a575048696a96516d857ae0da6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-ExtraBold.ttf?raw=true";
      name = "FiraSansCondensed-ExtraBold.ttf";
      sha256 = "d1e5181a65e04970ef17b83fa518277658217081a032c7f60b7ac0f101347cf2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-ExtraBoldItalic.ttf?raw=true";
      name = "FiraSansCondensed-ExtraBoldItalic.ttf";
      sha256 = "071e6c37e90a3ba2fb53ede9f88fd77d024770503665697187013397002b0c66";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-Black.ttf?raw=true";
      name = "FiraSansCondensed-Black.ttf";
      sha256 = "44a13b01570201ef0ba67a603f227166485ef93d2e1bd5d6e1b60d0be14d0975";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3d70f5d895f125abc00e3d25ab991526969f910/ofl/firasanscondensed/FiraSansCondensed-BlackItalic.ttf?raw=true";
      name = "FiraSansCondensed-BlackItalic.ttf";
      sha256 = "8ab2cfe67370b7cc37e8ad24619a6b0510e2467a07d6bc41c6b20da4ca2bf963";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FiraSansCondensed-Thin.ttf $out/share/fonts/truetype/FiraSansCondensed-Thin.ttf
     install -Dm644 FiraSansCondensed-ThinItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-ThinItalic.ttf
     install -Dm644 FiraSansCondensed-ExtraLight.ttf $out/share/fonts/truetype/FiraSansCondensed-ExtraLight.ttf
     install -Dm644 FiraSansCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-ExtraLightItalic.ttf
     install -Dm644 FiraSansCondensed-Light.ttf $out/share/fonts/truetype/FiraSansCondensed-Light.ttf
     install -Dm644 FiraSansCondensed-LightItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-LightItalic.ttf
     install -Dm644 FiraSansCondensed-Regular.ttf $out/share/fonts/truetype/FiraSansCondensed-Regular.ttf
     install -Dm644 FiraSansCondensed-Italic.ttf $out/share/fonts/truetype/FiraSansCondensed-Italic.ttf
     install -Dm644 FiraSansCondensed-Medium.ttf $out/share/fonts/truetype/FiraSansCondensed-Medium.ttf
     install -Dm644 FiraSansCondensed-MediumItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-MediumItalic.ttf
     install -Dm644 FiraSansCondensed-SemiBold.ttf $out/share/fonts/truetype/FiraSansCondensed-SemiBold.ttf
     install -Dm644 FiraSansCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-SemiBoldItalic.ttf
     install -Dm644 FiraSansCondensed-Bold.ttf $out/share/fonts/truetype/FiraSansCondensed-Bold.ttf
     install -Dm644 FiraSansCondensed-BoldItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-BoldItalic.ttf
     install -Dm644 FiraSansCondensed-ExtraBold.ttf $out/share/fonts/truetype/FiraSansCondensed-ExtraBold.ttf
     install -Dm644 FiraSansCondensed-ExtraBoldItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-ExtraBoldItalic.ttf
     install -Dm644 FiraSansCondensed-Black.ttf $out/share/fonts/truetype/FiraSansCondensed-Black.ttf
     install -Dm644 FiraSansCondensed-BlackItalic.ttf $out/share/fonts/truetype/FiraSansCondensed-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Fira Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
