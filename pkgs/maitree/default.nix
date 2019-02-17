{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maitree-${version}";
  version = "2017-05-23-170852";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-ExtraLight.ttf?raw=true";
      name = "Maitree-ExtraLight.ttf";
      sha256 = "aaa310f9bc913882863b1d39bd70978b7d068ac831ef3789bd921f781392343d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-Light.ttf?raw=true";
      name = "Maitree-Light.ttf";
      sha256 = "64096b22cb796958391c704992d0cf698deb3478d4af6c131f1b5a435e851e08";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-Regular.ttf?raw=true";
      name = "Maitree-Regular.ttf";
      sha256 = "0b175f9b468961d37faf21bfbf27207c5aeda9f2b029841bccaf2747c2c269be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-Medium.ttf?raw=true";
      name = "Maitree-Medium.ttf";
      sha256 = "6314fda8d95a2f69f16b63e8eca4a4a82e1b1ca519ec7039f99565d5d2b34e16";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-SemiBold.ttf?raw=true";
      name = "Maitree-SemiBold.ttf";
      sha256 = "d160545b5b802658431d17bac37f016c7ea6b8a16ae8cecd7f9389da52581216";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5d0ea41cd3b475127f0ca2ac1da38c3db69f18d4/ofl/maitree/Maitree-Bold.ttf?raw=true";
      name = "Maitree-Bold.ttf";
      sha256 = "59899168d044143108b18fce46003c6774217019a4878d4313f6793b9d17fbf2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Maitree-ExtraLight.ttf $out/share/fonts/truetype/Maitree-ExtraLight.ttf
     install -Dm644 Maitree-Light.ttf $out/share/fonts/truetype/Maitree-Light.ttf
     install -Dm644 Maitree-Regular.ttf $out/share/fonts/truetype/Maitree-Regular.ttf
     install -Dm644 Maitree-Medium.ttf $out/share/fonts/truetype/Maitree-Medium.ttf
     install -Dm644 Maitree-SemiBold.ttf $out/share/fonts/truetype/Maitree-SemiBold.ttf
     install -Dm644 Maitree-Bold.ttf $out/share/fonts/truetype/Maitree-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Maitree";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
