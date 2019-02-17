{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-condensed-${version}";
  version = "2017-03-31-224138";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-Light.ttf?raw=true";
      name = "RobotoCondensed-Light.ttf";
      sha256 = "b766b29053df4c6bfedbdf3cc33284717f835cdf6ca8d137c5106cee9dba68d3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-LightItalic.ttf?raw=true";
      name = "RobotoCondensed-LightItalic.ttf";
      sha256 = "da6861fa0ca6a29d305d5f484fbb228ea354ac9d27737e8cd7c15b754b4f9fb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-Regular.ttf?raw=true";
      name = "RobotoCondensed-Regular.ttf";
      sha256 = "6a2cfb7e61dd09d77526fd314b256894094f96e3a6f3149d9f8000c1132ef4b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-Italic.ttf?raw=true";
      name = "RobotoCondensed-Italic.ttf";
      sha256 = "351cc12eb1d11769056069a6c14f84e45c46bb18d1b7327bae45720aa9753f28";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-Bold.ttf?raw=true";
      name = "RobotoCondensed-Bold.ttf";
      sha256 = "03b4e8042b9af4bf3349428fa734ed583f2d5d83287e1f42cf4d514c909146ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/55aaf47ca89416e720a2449368943ff87fb6d02a/apache/robotocondensed/RobotoCondensed-BoldItalic.ttf?raw=true";
      name = "RobotoCondensed-BoldItalic.ttf";
      sha256 = "aecb99256fe43e06356bcf1af7a2a384fe9334dc21508f37c6259beae67e190e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoCondensed-Light.ttf $out/share/fonts/truetype/RobotoCondensed-Light.ttf
     install -Dm644 RobotoCondensed-LightItalic.ttf $out/share/fonts/truetype/RobotoCondensed-LightItalic.ttf
     install -Dm644 RobotoCondensed-Regular.ttf $out/share/fonts/truetype/RobotoCondensed-Regular.ttf
     install -Dm644 RobotoCondensed-Italic.ttf $out/share/fonts/truetype/RobotoCondensed-Italic.ttf
     install -Dm644 RobotoCondensed-Bold.ttf $out/share/fonts/truetype/RobotoCondensed-Bold.ttf
     install -Dm644 RobotoCondensed-BoldItalic.ttf $out/share/fonts/truetype/RobotoCondensed-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Roboto Condensed";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
