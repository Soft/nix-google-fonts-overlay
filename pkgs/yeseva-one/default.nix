{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yeseva-one-${version}";
  version = "2017-01-17-072935";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b4b24ba90689a28678104a750714cda2e6927981/ofl/yesevaone/YesevaOne-Regular.ttf?raw=true";
      name = "YesevaOne-Regular.ttf";
      sha256 = "88362b33820f0011e163e67b1d570fecd442aa8c05eaac89d5162f9c40d9dac3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YesevaOne-Regular.ttf $out/share/fonts/truetype/YesevaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Yeseva One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
