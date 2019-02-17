{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-guntur-${version}";
  version = "2017-05-08-212435";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/334ce650956d7b68d2df602e30392d66c297387c/ofl/hindguntur/HindGuntur-Light.ttf?raw=true";
      name = "HindGuntur-Light.ttf";
      sha256 = "c6812334af1c6ea7b372d2879155b66e39429e86bdc4569b6674bcf864aeea9b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/334ce650956d7b68d2df602e30392d66c297387c/ofl/hindguntur/HindGuntur-Regular.ttf?raw=true";
      name = "HindGuntur-Regular.ttf";
      sha256 = "a636fe1d683db31ad29c7b527785ecef8e69c88096a6cdbffddf88617d2f858e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/334ce650956d7b68d2df602e30392d66c297387c/ofl/hindguntur/HindGuntur-Medium.ttf?raw=true";
      name = "HindGuntur-Medium.ttf";
      sha256 = "c58ba8385534896456c979cef119ec9a1a6f409208237480fdbd5e69cff723d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/334ce650956d7b68d2df602e30392d66c297387c/ofl/hindguntur/HindGuntur-SemiBold.ttf?raw=true";
      name = "HindGuntur-SemiBold.ttf";
      sha256 = "5c4688001bc3966ec4f95cda62e37c444faccb64872b916cbcd3613ef33d8cbd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/334ce650956d7b68d2df602e30392d66c297387c/ofl/hindguntur/HindGuntur-Bold.ttf?raw=true";
      name = "HindGuntur-Bold.ttf";
      sha256 = "e5ce5eaa45ebd758f85e8058a9c60b2a0f90f84778a5dac2e3a741502279d251";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindGuntur-Light.ttf $out/share/fonts/truetype/HindGuntur-Light.ttf
     install -Dm644 HindGuntur-Regular.ttf $out/share/fonts/truetype/HindGuntur-Regular.ttf
     install -Dm644 HindGuntur-Medium.ttf $out/share/fonts/truetype/HindGuntur-Medium.ttf
     install -Dm644 HindGuntur-SemiBold.ttf $out/share/fonts/truetype/HindGuntur-SemiBold.ttf
     install -Dm644 HindGuntur-Bold.ttf $out/share/fonts/truetype/HindGuntur-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind Guntur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
