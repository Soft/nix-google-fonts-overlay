{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maven-pro-${version}";
  version = "2019-01-18-150155";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f10c5f96e61f6b871e46f3e29c586418e1f11598/ofl/mavenpro/MavenPro-Regular.ttf?raw=true";
      name = "MavenPro-Regular.ttf";
      sha256 = "318e29a7651cd14a43c03589741deb7b132cc45e8edba13eb1b4cd86e7b28f84";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MavenPro-Regular.ttf $out/share/fonts/truetype/MavenPro-Regular.ttf
  '';

  meta = with lib; {
    description = "Maven Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
