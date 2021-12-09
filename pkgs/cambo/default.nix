{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cambo-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d4b4f127ffc2ac17b2598fc9ec7c9bec3a9989cc/ofl/cambo/Cambo-Regular.ttf?raw=true";
      name = "Cambo-Regular.ttf";
      sha256 = "526c80a8d006783e899537314972ac43449b520f53b96befc17c47175e9b2e2a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cambo-Regular.ttf $out/share/fonts/truetype/Cambo-Regular.ttf
  '';

  meta = with lib; {
    description = "Cambo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
