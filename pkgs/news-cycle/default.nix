{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "news-cycle-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a65ad2eb07ae79ebc9d021d73229b4853a3db00d/ofl/newscycle/NewsCycle-Regular.ttf?raw=true";
      name = "NewsCycle-Regular.ttf";
      sha256 = "8653ccce06d26dcf19a68704a16063835fc9fea036638c2fcbd5bdc8c94e4e95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a65ad2eb07ae79ebc9d021d73229b4853a3db00d/ofl/newscycle/NewsCycle-Bold.ttf?raw=true";
      name = "NewsCycle-Bold.ttf";
      sha256 = "97f733a3a414cef6c44d6a4fde8ce2543facbfd1f5a35ae80dbfd691a89dd632";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NewsCycle-Regular.ttf $out/share/fonts/truetype/NewsCycle-Regular.ttf
     install -Dm644 NewsCycle-Bold.ttf $out/share/fonts/truetype/NewsCycle-Bold.ttf
  '';

  meta = with lib; {
    description = "News Cycle";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
