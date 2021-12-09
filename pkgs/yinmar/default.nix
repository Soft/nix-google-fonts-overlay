{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yinmar-${version}";
  version = "2016-01-29-205649";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7908dce93d00a47a0357217ba92c65864d54135f/ofl/yinmar/Yinmar-Regular.ttf?raw=true";
      name = "Yinmar-Regular.ttf";
      sha256 = "a1976639a99f252b3471839c85fe5e87fc1c4e0d1386c9f8ac8c5ff84d357e35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yinmar-Regular.ttf $out/share/fonts/truetype/Yinmar-Regular.ttf
  '';

  meta = with lib; {
    description = "Yinmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
