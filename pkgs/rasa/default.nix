{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rasa-${version}";
  version = "2017-05-16-161633";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/731f4941068ffc83ab912942d4e6b3668a5bd8b0/ofl/rasa/Rasa-Light.ttf?raw=true";
      name = "Rasa-Light.ttf";
      sha256 = "3f11fb010e2948bbbefd63f216f7a3620a8ac3a41f82839406a0e1bb2cd06a5b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/731f4941068ffc83ab912942d4e6b3668a5bd8b0/ofl/rasa/Rasa-Regular.ttf?raw=true";
      name = "Rasa-Regular.ttf";
      sha256 = "ca2ac7698bf074a9091a378e2ee4d5cf2ebd04e8128098a20fa29cfbfa92f553";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/731f4941068ffc83ab912942d4e6b3668a5bd8b0/ofl/rasa/Rasa-Medium.ttf?raw=true";
      name = "Rasa-Medium.ttf";
      sha256 = "8a216e7843117d90c6e05166020c4b40931af7aba4ee56c4e118c80e4ab3b3ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/731f4941068ffc83ab912942d4e6b3668a5bd8b0/ofl/rasa/Rasa-SemiBold.ttf?raw=true";
      name = "Rasa-SemiBold.ttf";
      sha256 = "77b6ec1abb44884ff493fe2aa7cdc15dc091752fbdd438c579fbf22b69760dfb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/731f4941068ffc83ab912942d4e6b3668a5bd8b0/ofl/rasa/Rasa-Bold.ttf?raw=true";
      name = "Rasa-Bold.ttf";
      sha256 = "d32c4acd0af7d5e7f3e3ee7c95131ca4620992a87a725293b59b968c56d3ee6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rasa-Light.ttf $out/share/fonts/truetype/Rasa-Light.ttf
     install -Dm644 Rasa-Regular.ttf $out/share/fonts/truetype/Rasa-Regular.ttf
     install -Dm644 Rasa-Medium.ttf $out/share/fonts/truetype/Rasa-Medium.ttf
     install -Dm644 Rasa-SemiBold.ttf $out/share/fonts/truetype/Rasa-SemiBold.ttf
     install -Dm644 Rasa-Bold.ttf $out/share/fonts/truetype/Rasa-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Rasa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
