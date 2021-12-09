{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cinzel-${version}";
  version = "2017-08-30-220506";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bdc56331ef52467b2b219751a47a9c7a6f8bddfe/ofl/cinzel/Cinzel-Regular.ttf?raw=true";
      name = "Cinzel-Regular.ttf";
      sha256 = "d88e9e8837708fcd211529cf0578f51dcfac3a21eb71b5847765dae9fe50551d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bdc56331ef52467b2b219751a47a9c7a6f8bddfe/ofl/cinzel/Cinzel-Bold.ttf?raw=true";
      name = "Cinzel-Bold.ttf";
      sha256 = "a20ac8935b6ea0124920f3e9095420b8042224773a545b57418cb64b7f685c12";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bdc56331ef52467b2b219751a47a9c7a6f8bddfe/ofl/cinzel/Cinzel-Black.ttf?raw=true";
      name = "Cinzel-Black.ttf";
      sha256 = "05aba24597f9678985f66257d4cf2eac8d09444dd2f5dd40c8c20e55e613998f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cinzel-Regular.ttf $out/share/fonts/truetype/Cinzel-Regular.ttf
     install -Dm644 Cinzel-Bold.ttf $out/share/fonts/truetype/Cinzel-Bold.ttf
     install -Dm644 Cinzel-Black.ttf $out/share/fonts/truetype/Cinzel-Black.ttf
  '';

  meta = with lib; {
    description = "Cinzel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
