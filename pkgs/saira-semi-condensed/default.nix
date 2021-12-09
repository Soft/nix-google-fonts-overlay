{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "saira-semi-condensed-${version}";
  version = "2016-12-06-220634";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Thin.ttf?raw=true";
      name = "SairaSemiCondensed-Thin.ttf";
      sha256 = "87163e0f5247162ff3f0eb4897fac7ce461e756dbae902bd940a8460f6730d68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-ExtraLight.ttf?raw=true";
      name = "SairaSemiCondensed-ExtraLight.ttf";
      sha256 = "61a841e4e7cbfa21fe3d2e97f8d75fe888055d5c6e7d3fdfdb1ad0868198dead";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Light.ttf?raw=true";
      name = "SairaSemiCondensed-Light.ttf";
      sha256 = "44af898351f2884e603c7ce60891be47e7def9891d7fdbff95c192bf8996fb4f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Regular.ttf?raw=true";
      name = "SairaSemiCondensed-Regular.ttf";
      sha256 = "9dad0fea2405ebc740092a0ca34e350ac235c0a040095068e0054b337520f93a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Medium.ttf?raw=true";
      name = "SairaSemiCondensed-Medium.ttf";
      sha256 = "bd886bd6f632b4906a4f469c81ccb37b1f0d68d4c175bef7277c8addb86cff2d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-SemiBold.ttf?raw=true";
      name = "SairaSemiCondensed-SemiBold.ttf";
      sha256 = "f7a32aded607fb364a940ca08b4dbe514346b4fbfa6bb1777c71edf6d7f0fe56";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Bold.ttf?raw=true";
      name = "SairaSemiCondensed-Bold.ttf";
      sha256 = "2ab7a35f798e149db1908ddae844024bcb975bdccbfc81dbac3429d0f6270b14";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-ExtraBold.ttf?raw=true";
      name = "SairaSemiCondensed-ExtraBold.ttf";
      sha256 = "3a394a5b48a6838c6c2002f0c585af690e41ae23a8a8d923e02009d09fafbadd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/43adbd11d49e83c1da633ee34fa51d1bd088db2e/ofl/sairasemicondensed/SairaSemiCondensed-Black.ttf?raw=true";
      name = "SairaSemiCondensed-Black.ttf";
      sha256 = "eabab4239393853625fa6522db4805f2ebe97e745a875e76f82ecb6e659e81a4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SairaSemiCondensed-Thin.ttf $out/share/fonts/truetype/SairaSemiCondensed-Thin.ttf
     install -Dm644 SairaSemiCondensed-ExtraLight.ttf $out/share/fonts/truetype/SairaSemiCondensed-ExtraLight.ttf
     install -Dm644 SairaSemiCondensed-Light.ttf $out/share/fonts/truetype/SairaSemiCondensed-Light.ttf
     install -Dm644 SairaSemiCondensed-Regular.ttf $out/share/fonts/truetype/SairaSemiCondensed-Regular.ttf
     install -Dm644 SairaSemiCondensed-Medium.ttf $out/share/fonts/truetype/SairaSemiCondensed-Medium.ttf
     install -Dm644 SairaSemiCondensed-SemiBold.ttf $out/share/fonts/truetype/SairaSemiCondensed-SemiBold.ttf
     install -Dm644 SairaSemiCondensed-Bold.ttf $out/share/fonts/truetype/SairaSemiCondensed-Bold.ttf
     install -Dm644 SairaSemiCondensed-ExtraBold.ttf $out/share/fonts/truetype/SairaSemiCondensed-ExtraBold.ttf
     install -Dm644 SairaSemiCondensed-Black.ttf $out/share/fonts/truetype/SairaSemiCondensed-Black.ttf
  '';

  meta = with lib; {
    description = "Saira Semi Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
