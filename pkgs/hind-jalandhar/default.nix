{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-jalandhar-${version}";
  version = "2016-01-15-173120";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d3a8c955745b2215bad9bf588fe4632cd02d7bd/ofl/hindjalandhar/HindJalandhar-Light.ttf?raw=true";
      name = "HindJalandhar-Light.ttf";
      sha256 = "b4fec2a8eedb6ecdd29ed7862bb76f847e077424f0337c7eaf09185aa1447d47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d3a8c955745b2215bad9bf588fe4632cd02d7bd/ofl/hindjalandhar/HindJalandhar-Regular.ttf?raw=true";
      name = "HindJalandhar-Regular.ttf";
      sha256 = "ec31a2104441edd54607610e7c9c14a13cb7fd57d63cff24330a1734a4dad7e1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d3a8c955745b2215bad9bf588fe4632cd02d7bd/ofl/hindjalandhar/HindJalandhar-Medium.ttf?raw=true";
      name = "HindJalandhar-Medium.ttf";
      sha256 = "8d15a3dba9d59aa768c78d62daa259129e391ca68994d32a954b193e77c208de";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d3a8c955745b2215bad9bf588fe4632cd02d7bd/ofl/hindjalandhar/HindJalandhar-SemiBold.ttf?raw=true";
      name = "HindJalandhar-SemiBold.ttf";
      sha256 = "8f231651b67f8fa5dbd3e464036ce0e9eaf8c9d12e34946196a7b6a79ccadc44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0d3a8c955745b2215bad9bf588fe4632cd02d7bd/ofl/hindjalandhar/HindJalandhar-Bold.ttf?raw=true";
      name = "HindJalandhar-Bold.ttf";
      sha256 = "40ae9e8beea31bcf27e0a223424a5b904de716f6d3343c9425a268a7c04ac1a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindJalandhar-Light.ttf $out/share/fonts/truetype/HindJalandhar-Light.ttf
     install -Dm644 HindJalandhar-Regular.ttf $out/share/fonts/truetype/HindJalandhar-Regular.ttf
     install -Dm644 HindJalandhar-Medium.ttf $out/share/fonts/truetype/HindJalandhar-Medium.ttf
     install -Dm644 HindJalandhar-SemiBold.ttf $out/share/fonts/truetype/HindJalandhar-SemiBold.ttf
     install -Dm644 HindJalandhar-Bold.ttf $out/share/fonts/truetype/HindJalandhar-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind Jalandhar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
