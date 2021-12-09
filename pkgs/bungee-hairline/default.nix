{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-hairline-${version}";
  version = "2017-05-23-171455";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fb1fae9a43df913c39e4ee0423c60f4e737c9902/ofl/bungeehairline/BungeeHairline-Regular.ttf?raw=true";
      name = "BungeeHairline-Regular.ttf";
      sha256 = "a5fb25778bbfc169ea809a87b4ba74865bd386019df785a0777b44bcb6b3fdc3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeHairline-Regular.ttf $out/share/fonts/truetype/BungeeHairline-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Hairline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
