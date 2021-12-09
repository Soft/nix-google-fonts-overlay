{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "molle-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/62b0534fc7ce9100b0ee0129dfab3381c44ffbd9/ofl/molle/Molle-Regular.ttf?raw=true";
      name = "Molle-Regular.ttf";
      sha256 = "5693a09a77e5afd28380d269e2cf03ca78c4fd92a8bacd248910221cbfe2ef58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Molle-Regular.ttf $out/share/fonts/truetype/Molle-Regular.ttf
  '';

  meta = with lib; {
    description = "Molle";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
