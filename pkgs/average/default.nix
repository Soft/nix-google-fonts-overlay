{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "average-${version}";
  version = "2017-08-07-195854";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0f95952384d52f3d4fec1c40e86021dcb5e7a58b/ofl/average/Average-Regular.ttf?raw=true";
      name = "Average-Regular.ttf";
      sha256 = "dd9e57c09e6312e18fe8d77283eaa64db6bead988057f526af7fce878270a16d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Average-Regular.ttf $out/share/fonts/truetype/Average-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Average";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
