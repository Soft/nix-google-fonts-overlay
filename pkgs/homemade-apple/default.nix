{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "homemade-apple-${version}";
  version = "2017-08-07-204430";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8e94f9c1272836a25d2e65bd7d729e63ac9edb66/apache/homemadeapple/HomemadeApple-Regular.ttf?raw=true";
      name = "HomemadeApple-Regular.ttf";
      sha256 = "dd1baaca3cde1b1f8415aed3b0aea6808655c9d9ca5a99c7282d9accc16c1a58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HomemadeApple-Regular.ttf $out/share/fonts/truetype/HomemadeApple-Regular.ttf
  '';

  meta = with lib; {
    description = "Homemade Apple";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
