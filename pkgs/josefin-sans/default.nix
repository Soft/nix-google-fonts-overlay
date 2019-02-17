{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-sans-${version}";
  version = "2017-07-31-225900";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-Thin.ttf?raw=true";
      name = "JosefinSans-Thin.ttf";
      sha256 = "07a9e2e991e567edaadee090d46f6466fde95b5feddafa17f13e1b726e65b7e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-ThinItalic.ttf?raw=true";
      name = "JosefinSans-ThinItalic.ttf";
      sha256 = "327c0bbf9f7ee0a9f9fab7a9ea5761bedcdf512f14958387374e0180e4398b44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-Light.ttf?raw=true";
      name = "JosefinSans-Light.ttf";
      sha256 = "15d5463872ae62cebd82f190c731fa51c5a6339b6c3e4dacec294eee4af64de8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-LightItalic.ttf?raw=true";
      name = "JosefinSans-LightItalic.ttf";
      sha256 = "5a1063cb5509200ba34b1934bf9261d6405644103e979cff1614fa6c50f0e8eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-Regular.ttf?raw=true";
      name = "JosefinSans-Regular.ttf";
      sha256 = "73a4c076e4b469c7956e6a3f625b79e0fb4b6a7ee3cfe4bc3ed0533209586fcf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-Italic.ttf?raw=true";
      name = "JosefinSans-Italic.ttf";
      sha256 = "898c2cc72d2304371dd7ec531f34569d010269c73943fc98639bd308bdc35c44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-SemiBold.ttf?raw=true";
      name = "JosefinSans-SemiBold.ttf";
      sha256 = "1436fc740da2183b71437031f78fb88e5b8603595ae106ff9217f27a1b91cbea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-SemiBoldItalic.ttf?raw=true";
      name = "JosefinSans-SemiBoldItalic.ttf";
      sha256 = "aa81855cc6919d3f94da4333379eb4082f7fad890de0be91c53c8a6d6f768112";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-Bold.ttf?raw=true";
      name = "JosefinSans-Bold.ttf";
      sha256 = "5a1389056f87903a1c2176a28cc754587342ac65c860a4b79e7c5fc25ee73018";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ec471fa2ec3d4fbed3ea7cd646f8970c247ff347/ofl/josefinsans/JosefinSans-BoldItalic.ttf?raw=true";
      name = "JosefinSans-BoldItalic.ttf";
      sha256 = "194d6685b9b392bcf2c2a515fa875f75db095430ac81237e32233f3fd37b4bc1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSans-Thin.ttf $out/share/fonts/truetype/JosefinSans-Thin.ttf
     install -Dm644 JosefinSans-ThinItalic.ttf $out/share/fonts/truetype/JosefinSans-ThinItalic.ttf
     install -Dm644 JosefinSans-Light.ttf $out/share/fonts/truetype/JosefinSans-Light.ttf
     install -Dm644 JosefinSans-LightItalic.ttf $out/share/fonts/truetype/JosefinSans-LightItalic.ttf
     install -Dm644 JosefinSans-Regular.ttf $out/share/fonts/truetype/JosefinSans-Regular.ttf
     install -Dm644 JosefinSans-Italic.ttf $out/share/fonts/truetype/JosefinSans-Italic.ttf
     install -Dm644 JosefinSans-SemiBold.ttf $out/share/fonts/truetype/JosefinSans-SemiBold.ttf
     install -Dm644 JosefinSans-SemiBoldItalic.ttf $out/share/fonts/truetype/JosefinSans-SemiBoldItalic.ttf
     install -Dm644 JosefinSans-Bold.ttf $out/share/fonts/truetype/JosefinSans-Bold.ttf
     install -Dm644 JosefinSans-BoldItalic.ttf $out/share/fonts/truetype/JosefinSans-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Josefin Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
