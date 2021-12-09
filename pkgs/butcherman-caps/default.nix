{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "butcherman-caps-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21e99970c589097ee512c3f9cdc93c6f08d730fe/ofl/butchermancaps/ButchermanCaps-Regular.ttf?raw=true";
      name = "ButchermanCaps-Regular.ttf";
      sha256 = "ef8e117d3937a3d4f14d76d21c68ac18ac780321c6fe5150cf433004b47c308f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ButchermanCaps-Regular.ttf $out/share/fonts/truetype/ButchermanCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Butcherman Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
