{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-siliguri-${version}";
  version = "2017-05-08-212533";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35946a558d1b7528d35006642b79682262b9a011/ofl/hindsiliguri/HindSiliguri-Light.ttf?raw=true";
      name = "HindSiliguri-Light.ttf";
      sha256 = "9d55d0dcc9b54cb0870ae5d5b24caf8d3ca9f304cd90ee6f4fe1e6c8ef833e5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35946a558d1b7528d35006642b79682262b9a011/ofl/hindsiliguri/HindSiliguri-Regular.ttf?raw=true";
      name = "HindSiliguri-Regular.ttf";
      sha256 = "45071a7da902a74877f432722f525d00502d61aef71fca4cab3da8a23156c33d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35946a558d1b7528d35006642b79682262b9a011/ofl/hindsiliguri/HindSiliguri-Medium.ttf?raw=true";
      name = "HindSiliguri-Medium.ttf";
      sha256 = "f2759c530d647720a4d4e99faef3c2d150e1452193a9c83fb81c8d29805c13ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35946a558d1b7528d35006642b79682262b9a011/ofl/hindsiliguri/HindSiliguri-SemiBold.ttf?raw=true";
      name = "HindSiliguri-SemiBold.ttf";
      sha256 = "92a9a68240883467830b87b2568242a59e68d4535e9e15f087650e12c4aaca83";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35946a558d1b7528d35006642b79682262b9a011/ofl/hindsiliguri/HindSiliguri-Bold.ttf?raw=true";
      name = "HindSiliguri-Bold.ttf";
      sha256 = "d135765781d1a4aebc7dd4a2af221427ec8689060121d8a48b19bca3eeb3977e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindSiliguri-Light.ttf $out/share/fonts/truetype/HindSiliguri-Light.ttf
     install -Dm644 HindSiliguri-Regular.ttf $out/share/fonts/truetype/HindSiliguri-Regular.ttf
     install -Dm644 HindSiliguri-Medium.ttf $out/share/fonts/truetype/HindSiliguri-Medium.ttf
     install -Dm644 HindSiliguri-SemiBold.ttf $out/share/fonts/truetype/HindSiliguri-SemiBold.ttf
     install -Dm644 HindSiliguri-Bold.ttf $out/share/fonts/truetype/HindSiliguri-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind Siliguri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
