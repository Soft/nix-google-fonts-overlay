{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shanti-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ccda7bf739842777d42661d1b384b926194e24b/ofl/shanti/Shanti-Regular.ttf?raw=true";
      name = "Shanti-Regular.ttf";
      sha256 = "8f9454df87534233b21fcfc56ed76e9749c627cae9ab7ade1967fc1dc084ce62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shanti-Regular.ttf $out/share/fonts/truetype/Shanti-Regular.ttf
  '';

  meta = with lib; {
    description = "Shanti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
