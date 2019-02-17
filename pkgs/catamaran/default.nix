{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "catamaran-${version}";
  version = "2017-05-01-173023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Thin.ttf?raw=true";
      name = "Catamaran-Thin.ttf";
      sha256 = "0bb3e460c85cef0d35a93550762676cb50ad2799aef8aead051a922a1de9d015";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-ExtraLight.ttf?raw=true";
      name = "Catamaran-ExtraLight.ttf";
      sha256 = "09c053e2c62be31d91441e40227d970bd5e3db688c98c5e7c19dec69d4c3b327";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Light.ttf?raw=true";
      name = "Catamaran-Light.ttf";
      sha256 = "ad1e561798414ef05396cfb5f0725f883ab5641521ed70f0a02163dc7c47c391";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Regular.ttf?raw=true";
      name = "Catamaran-Regular.ttf";
      sha256 = "e854cebaef3f52385c4d0f68302caa8723fb39a39bc78ec3599b189826f16806";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Medium.ttf?raw=true";
      name = "Catamaran-Medium.ttf";
      sha256 = "c241a2b87ffdbbaa2f0695460998e14ca0e128df8c7cf789d2885eea754b4c7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-SemiBold.ttf?raw=true";
      name = "Catamaran-SemiBold.ttf";
      sha256 = "88620fc7c0aa8ff82c5f4ade70dc2fb16902509cccfd09dcde39657da2817c1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Bold.ttf?raw=true";
      name = "Catamaran-Bold.ttf";
      sha256 = "e88b63e5b808c1297246739f560312e77af65cfcbef2e9693da94b78d352be6b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-ExtraBold.ttf?raw=true";
      name = "Catamaran-ExtraBold.ttf";
      sha256 = "202fcb25731f0396271d3e1bcb3539280039f622cff45014d9eb58f401921b22";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/46c3e6f2a09e6229bf65534b90e10776836cde55/ofl/catamaran/Catamaran-Black.ttf?raw=true";
      name = "Catamaran-Black.ttf";
      sha256 = "b380d9847e50968132d5b34b5de8c92347f161707160159ae13514d6c542b4b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Catamaran-Thin.ttf $out/share/fonts/truetype/Catamaran-Thin.ttf
     install -Dm644 Catamaran-ExtraLight.ttf $out/share/fonts/truetype/Catamaran-ExtraLight.ttf
     install -Dm644 Catamaran-Light.ttf $out/share/fonts/truetype/Catamaran-Light.ttf
     install -Dm644 Catamaran-Regular.ttf $out/share/fonts/truetype/Catamaran-Regular.ttf
     install -Dm644 Catamaran-Medium.ttf $out/share/fonts/truetype/Catamaran-Medium.ttf
     install -Dm644 Catamaran-SemiBold.ttf $out/share/fonts/truetype/Catamaran-SemiBold.ttf
     install -Dm644 Catamaran-Bold.ttf $out/share/fonts/truetype/Catamaran-Bold.ttf
     install -Dm644 Catamaran-ExtraBold.ttf $out/share/fonts/truetype/Catamaran-ExtraBold.ttf
     install -Dm644 Catamaran-Black.ttf $out/share/fonts/truetype/Catamaran-Black.ttf
  '';

  meta = with stdenv.lib; {
    description = "Catamaran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
