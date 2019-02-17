{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-negative-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd13b1839972af519203ec781f2c4e3851e69c99/ofl/signikanegative/SignikaNegative-Light.ttf?raw=true";
      name = "SignikaNegative-Light.ttf";
      sha256 = "c3bf65f324e08ec6341961662fac28774c7aaf8041e2e3100a580341debc648a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd13b1839972af519203ec781f2c4e3851e69c99/ofl/signikanegative/SignikaNegative-Regular.ttf?raw=true";
      name = "SignikaNegative-Regular.ttf";
      sha256 = "0f6d6760c64eb6cdd778e964700a7b4e65d02009854e530150f6e50c450fa360";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/signikanegative/SignikaNegative-SemiBold.ttf?raw=true";
      name = "SignikaNegative-SemiBold.ttf";
      sha256 = "569ca46537ad5621a0980d4dd08b8f7fde951e4c537a2b5f5d9d4d7b02e0a210";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd13b1839972af519203ec781f2c4e3851e69c99/ofl/signikanegative/SignikaNegative-Bold.ttf?raw=true";
      name = "SignikaNegative-Bold.ttf";
      sha256 = "fd757153a9b6e5c8fc8a498204c86899762f33687763a119f59c39b19f14364e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SignikaNegative-Light.ttf $out/share/fonts/truetype/SignikaNegative-Light.ttf
     install -Dm644 SignikaNegative-Regular.ttf $out/share/fonts/truetype/SignikaNegative-Regular.ttf
     install -Dm644 SignikaNegative-SemiBold.ttf $out/share/fonts/truetype/SignikaNegative-SemiBold.ttf
     install -Dm644 SignikaNegative-Bold.ttf $out/share/fonts/truetype/SignikaNegative-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Signika Negative";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
