{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mitr-${version}";
  version = "2017-05-11-034546";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-ExtraLight.ttf?raw=true";
      name = "Mitr-ExtraLight.ttf";
      sha256 = "dc3e6a03603bb0db3dc6833042e218a917d211d52d93bca426aa606f129d4488";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-Light.ttf?raw=true";
      name = "Mitr-Light.ttf";
      sha256 = "0ddb2f43bc071cd1546d1abdb0447c4a411e06450e69d97c838c2725fc8064a6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-Regular.ttf?raw=true";
      name = "Mitr-Regular.ttf";
      sha256 = "3763923ca8d860f9c06f483f663cd3d8d94e9ed8c2f35a7ce35bb6b13e1219fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-Medium.ttf?raw=true";
      name = "Mitr-Medium.ttf";
      sha256 = "847340933424d473bff6d011bc08543a2a2d2a670985a93e3431e3ac8926068f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-SemiBold.ttf?raw=true";
      name = "Mitr-SemiBold.ttf";
      sha256 = "257e8612923ed13838b2f0a0f9b25527aa83513c657df049a5ee608e6d4a059d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6f29c3d25a6844197d4a8c1be3582734130cbdf1/ofl/mitr/Mitr-Bold.ttf?raw=true";
      name = "Mitr-Bold.ttf";
      sha256 = "92349c05cd6a35549d0fb3e9b0d7d73059717e212cbda182ee28e5917150bc34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mitr-ExtraLight.ttf $out/share/fonts/truetype/Mitr-ExtraLight.ttf
     install -Dm644 Mitr-Light.ttf $out/share/fonts/truetype/Mitr-Light.ttf
     install -Dm644 Mitr-Regular.ttf $out/share/fonts/truetype/Mitr-Regular.ttf
     install -Dm644 Mitr-Medium.ttf $out/share/fonts/truetype/Mitr-Medium.ttf
     install -Dm644 Mitr-SemiBold.ttf $out/share/fonts/truetype/Mitr-SemiBold.ttf
     install -Dm644 Mitr-Bold.ttf $out/share/fonts/truetype/Mitr-Bold.ttf
  '';

  meta = with lib; {
    description = "Mitr";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
