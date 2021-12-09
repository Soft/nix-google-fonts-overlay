{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2abb465bde590713c4ffc03b785f77771b56c49c/ofl/signika/Signika-Light.ttf?raw=true";
      name = "Signika-Light.ttf";
      sha256 = "9ce8ef63ec2ed396fd9ce4e31b6f798d0143746d46bf6f5bcebdd8477d7978e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2abb465bde590713c4ffc03b785f77771b56c49c/ofl/signika/Signika-Regular.ttf?raw=true";
      name = "Signika-Regular.ttf";
      sha256 = "cea6cddac67d6baa98edfe13bafdea2650244dee850db1f530916e9acac6d1d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/signika/Signika-SemiBold.ttf?raw=true";
      name = "Signika-SemiBold.ttf";
      sha256 = "c654b274f8d0dbc0eafb39e670371e2fa4bc3984c8e950a15d025efc59cc8d1a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2abb465bde590713c4ffc03b785f77771b56c49c/ofl/signika/Signika-Bold.ttf?raw=true";
      name = "Signika-Bold.ttf";
      sha256 = "2c64c17725f9413432c29edc78d074fd7c4a59797c1d2a962fd4ea3fec1f5090";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Signika-Light.ttf $out/share/fonts/truetype/Signika-Light.ttf
     install -Dm644 Signika-Regular.ttf $out/share/fonts/truetype/Signika-Regular.ttf
     install -Dm644 Signika-SemiBold.ttf $out/share/fonts/truetype/Signika-SemiBold.ttf
     install -Dm644 Signika-Bold.ttf $out/share/fonts/truetype/Signika-Bold.ttf
  '';

  meta = with lib; {
    description = "Signika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
