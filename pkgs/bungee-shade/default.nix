{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-shade-${version}";
  version = "2017-05-23-171003";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ec727b2c6ab8b81b2c7a4e7d59e82f253fecf2f/ofl/bungeeshade/BungeeShade-Regular.ttf?raw=true";
      name = "BungeeShade-Regular.ttf";
      sha256 = "cc4e08d958885390fa105fcbc7f614ad8d480303e978ef63c82c5313980c27c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeShade-Regular.ttf $out/share/fonts/truetype/BungeeShade-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Bungee Shade";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
