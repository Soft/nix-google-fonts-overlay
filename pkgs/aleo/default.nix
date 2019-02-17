{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aleo-${version}";
  version = "2018-12-05-160959";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-Light.ttf?raw=true";
      name = "Aleo-Light.ttf";
      sha256 = "449e5eff1d5ee3a1eb0007d5cfa6b4d60cbaf8aa3e9f27cd8226ddd5e0847f77";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-LightItalic.ttf?raw=true";
      name = "Aleo-LightItalic.ttf";
      sha256 = "551281ced4f4faef32a425dbcb3715fc9bcbf3975305b702084d25715c46bfee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-Regular.ttf?raw=true";
      name = "Aleo-Regular.ttf";
      sha256 = "ffa14b81a2d7780dd4790dc189568f602594e2e39a22b705f56e86849e32992d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-Italic.ttf?raw=true";
      name = "Aleo-Italic.ttf";
      sha256 = "2b5adf3062b2897c4b0aeb6384fd900acee82470b4f85a82d36e8c28b95b3fb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-Bold.ttf?raw=true";
      name = "Aleo-Bold.ttf";
      sha256 = "95ae143f3bdd7441efcb45b5d59d9c98f0c71fa773b8fd2e4a485fd82f8579d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/63f4a1ae7e5b0d40f0e27bdc4ba5217e1e18d446/ofl/aleo/Aleo-BoldItalic.ttf?raw=true";
      name = "Aleo-BoldItalic.ttf";
      sha256 = "c3d1b74837c8783b9021c0550423bb7ee7fc53f6554b7d636fab5284d501bf58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aleo-Light.ttf $out/share/fonts/truetype/Aleo-Light.ttf
     install -Dm644 Aleo-LightItalic.ttf $out/share/fonts/truetype/Aleo-LightItalic.ttf
     install -Dm644 Aleo-Regular.ttf $out/share/fonts/truetype/Aleo-Regular.ttf
     install -Dm644 Aleo-Italic.ttf $out/share/fonts/truetype/Aleo-Italic.ttf
     install -Dm644 Aleo-Bold.ttf $out/share/fonts/truetype/Aleo-Bold.ttf
     install -Dm644 Aleo-BoldItalic.ttf $out/share/fonts/truetype/Aleo-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Aleo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
