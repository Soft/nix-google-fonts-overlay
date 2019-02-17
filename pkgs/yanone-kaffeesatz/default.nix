{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yanone-kaffeesatz-${version}";
  version = "2017-01-19-043125";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d3eb6bb6431308f9631be83b6bc58ad4d9afba6/ofl/yanonekaffeesatz/YanoneKaffeesatz-ExtraLight.ttf?raw=true";
      name = "YanoneKaffeesatz-ExtraLight.ttf";
      sha256 = "0b7beb0004f0f5fe2c0dc4360cedb0f24e8578fb83343c68da2887e741982aea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d3eb6bb6431308f9631be83b6bc58ad4d9afba6/ofl/yanonekaffeesatz/YanoneKaffeesatz-Light.ttf?raw=true";
      name = "YanoneKaffeesatz-Light.ttf";
      sha256 = "9f16305b5f387e6428b51eef208a444be44b76ccbf87de0a4b4dd74b8e4924ad";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d3eb6bb6431308f9631be83b6bc58ad4d9afba6/ofl/yanonekaffeesatz/YanoneKaffeesatz-Regular.ttf?raw=true";
      name = "YanoneKaffeesatz-Regular.ttf";
      sha256 = "85ae2a18916d9c772541c6d4808588f0e077cbe7c893a7a356a38a5a1a89841b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7d3eb6bb6431308f9631be83b6bc58ad4d9afba6/ofl/yanonekaffeesatz/YanoneKaffeesatz-Bold.ttf?raw=true";
      name = "YanoneKaffeesatz-Bold.ttf";
      sha256 = "fb8e48fbf7b1866b129899dc06f75919ec4116ec21e35eeb6db41058d1423f50";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YanoneKaffeesatz-ExtraLight.ttf $out/share/fonts/truetype/YanoneKaffeesatz-ExtraLight.ttf
     install -Dm644 YanoneKaffeesatz-Light.ttf $out/share/fonts/truetype/YanoneKaffeesatz-Light.ttf
     install -Dm644 YanoneKaffeesatz-Regular.ttf $out/share/fonts/truetype/YanoneKaffeesatz-Regular.ttf
     install -Dm644 YanoneKaffeesatz-Bold.ttf $out/share/fonts/truetype/YanoneKaffeesatz-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Yanone Kaffeesatz";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
