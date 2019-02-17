{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-sc-${version}";
  version = "2017-02-07-173828";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76b26bd5f369b72bc0d39471fb7c5092c85914d0/ofl/cormorantsc/CormorantSC-Light.ttf?raw=true";
      name = "CormorantSC-Light.ttf";
      sha256 = "37aa5dc1a9d1c69f0f87fd486ed807178a0aa9b0e09fd0bd054dd747e57786cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76b26bd5f369b72bc0d39471fb7c5092c85914d0/ofl/cormorantsc/CormorantSC-Regular.ttf?raw=true";
      name = "CormorantSC-Regular.ttf";
      sha256 = "38271a83e53289b189bfc00e4b8deef1beb4640ec207875c573b9b57aaa6b15e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76b26bd5f369b72bc0d39471fb7c5092c85914d0/ofl/cormorantsc/CormorantSC-Medium.ttf?raw=true";
      name = "CormorantSC-Medium.ttf";
      sha256 = "91ab6067047556cd8976c920a9327d632b7f7f137f238bc2c1d345d2be9e9302";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76b26bd5f369b72bc0d39471fb7c5092c85914d0/ofl/cormorantsc/CormorantSC-SemiBold.ttf?raw=true";
      name = "CormorantSC-SemiBold.ttf";
      sha256 = "65ffbcf9fded0bcca5e31339b9c1662aa2a3fbf41eaca472690fe0d304fc18e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/76b26bd5f369b72bc0d39471fb7c5092c85914d0/ofl/cormorantsc/CormorantSC-Bold.ttf?raw=true";
      name = "CormorantSC-Bold.ttf";
      sha256 = "6f8f0c52614c82bd3569a24c3ec1aafce229af9d8bb09a090d88e4e9b0cb0557";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantSC-Light.ttf $out/share/fonts/truetype/CormorantSC-Light.ttf
     install -Dm644 CormorantSC-Regular.ttf $out/share/fonts/truetype/CormorantSC-Regular.ttf
     install -Dm644 CormorantSC-Medium.ttf $out/share/fonts/truetype/CormorantSC-Medium.ttf
     install -Dm644 CormorantSC-SemiBold.ttf $out/share/fonts/truetype/CormorantSC-SemiBold.ttf
     install -Dm644 CormorantSC-Bold.ttf $out/share/fonts/truetype/CormorantSC-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cormorant SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
