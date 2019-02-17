{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quicksand-${version}";
  version = "2016-12-01-175208";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f62265cacd51b26bd0f492ea4e88e3688650dc5e/ofl/quicksand/Quicksand-Light.ttf?raw=true";
      name = "Quicksand-Light.ttf";
      sha256 = "96c73d510174a363670f015d8fabe8fd476e5ecf508b73e45945f9d062a9790f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f62265cacd51b26bd0f492ea4e88e3688650dc5e/ofl/quicksand/Quicksand-Regular.ttf?raw=true";
      name = "Quicksand-Regular.ttf";
      sha256 = "485393d6f99eaed0e2122ca867ab0bd6d8c24648d3087ef4733740f14b252737";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f62265cacd51b26bd0f492ea4e88e3688650dc5e/ofl/quicksand/Quicksand-Medium.ttf?raw=true";
      name = "Quicksand-Medium.ttf";
      sha256 = "e81f62ce1264450b3bb215d4e3fddb981cfe4f304cdeff9179f8ee25bf4545e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f62265cacd51b26bd0f492ea4e88e3688650dc5e/ofl/quicksand/Quicksand-Bold.ttf?raw=true";
      name = "Quicksand-Bold.ttf";
      sha256 = "8f144a2fe7cf8f34a35d290376fd1892ea5e91722514a9e83af52b3dd2d98d75";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quicksand-Light.ttf $out/share/fonts/truetype/Quicksand-Light.ttf
     install -Dm644 Quicksand-Regular.ttf $out/share/fonts/truetype/Quicksand-Regular.ttf
     install -Dm644 Quicksand-Medium.ttf $out/share/fonts/truetype/Quicksand-Medium.ttf
     install -Dm644 Quicksand-Bold.ttf $out/share/fonts/truetype/Quicksand-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Quicksand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
