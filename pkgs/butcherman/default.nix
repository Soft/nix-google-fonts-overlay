{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butcherman-${version}";
  version = "2017-08-07-200737";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8bfe28adb8dbab52d23b078006b3957c5d2e9129/ofl/butcherman/Butcherman-Regular.ttf?raw=true";
      name = "Butcherman-Regular.ttf";
      sha256 = "b8cee5e2cdc71f44e6806dc0db1090a3ce2e48ca727072073700bf646b0ce6b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Butcherman-Regular.ttf $out/share/fonts/truetype/Butcherman-Regular.ttf
  '';

  meta = with lib; {
    description = "Butcherman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
