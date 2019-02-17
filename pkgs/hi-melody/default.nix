{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hi-melody-${version}";
  version = "2018-03-13-210324";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1ef157d3939299d14563418b2f7271b20f0e9161/ofl/himelody/HiMelody-Regular.ttf?raw=true";
      name = "HiMelody-Regular.ttf";
      sha256 = "360d2c0a880918aa48328d1d9219f5390788d09a1c9353e12b471de018673ae6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HiMelody-Regular.ttf $out/share/fonts/truetype/HiMelody-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hi Melody";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
