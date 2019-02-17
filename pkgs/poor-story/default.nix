{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poor-story-${version}";
  version = "2018-03-13-210324";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1ef157d3939299d14563418b2f7271b20f0e9161/ofl/poorstory/PoorStory-Regular.ttf?raw=true";
      name = "PoorStory-Regular.ttf";
      sha256 = "831ab87f7b5463f9cd83ac249bf386816f3a478f1d226427c88cac907adb7ee2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoorStory-Regular.ttf $out/share/fonts/truetype/PoorStory-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Poor Story";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
