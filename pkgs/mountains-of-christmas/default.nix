{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mountains-of-christmas-${version}";
  version = "2017-08-07-233143";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3ec322aa5ae228023f20b8ec62507c75d2dd71f/apache/mountainsofchristmas/MountainsofChristmas-Regular.ttf?raw=true";
      name = "MountainsofChristmas-Regular.ttf";
      sha256 = "3855303be6b88707c00bb271f9c95e996605e9a8e656b3a30686862352b1052e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3ec322aa5ae228023f20b8ec62507c75d2dd71f/apache/mountainsofchristmas/MountainsofChristmas-Bold.ttf?raw=true";
      name = "MountainsofChristmas-Bold.ttf";
      sha256 = "4c6126f43c650c81d236fd04ffc2fccbc3f37438c304cafad6894a835c2250ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MountainsofChristmas-Regular.ttf $out/share/fonts/truetype/MountainsofChristmas-Regular.ttf
     install -Dm644 MountainsofChristmas-Bold.ttf $out/share/fonts/truetype/MountainsofChristmas-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mountains of Christmas";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
