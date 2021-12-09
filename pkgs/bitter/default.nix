{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitter-${version}";
  version = "2017-08-07-195115";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/80cd549b6e03c20eb5992251beea1cd6c7f8ed1f/ofl/bitter/Bitter-Regular.ttf?raw=true";
      name = "Bitter-Regular.ttf";
      sha256 = "1e12bf5775872f2769263436e41c4552ff10fe39fb887ce47b30ab681a3bea08";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/80cd549b6e03c20eb5992251beea1cd6c7f8ed1f/ofl/bitter/Bitter-Italic.ttf?raw=true";
      name = "Bitter-Italic.ttf";
      sha256 = "e40756137ac02f3d5fa8a9f0be0d8632d1a0fbe82858c74b9e76d6fd50d472fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/80cd549b6e03c20eb5992251beea1cd6c7f8ed1f/ofl/bitter/Bitter-Bold.ttf?raw=true";
      name = "Bitter-Bold.ttf";
      sha256 = "917e378ba9d105bcc360431c196735310dad63676a44e7067055d11b43a31d14";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bitter-Regular.ttf $out/share/fonts/truetype/Bitter-Regular.ttf
     install -Dm644 Bitter-Italic.ttf $out/share/fonts/truetype/Bitter-Italic.ttf
     install -Dm644 Bitter-Bold.ttf $out/share/fonts/truetype/Bitter-Bold.ttf
  '';

  meta = with lib; {
    description = "Bitter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
