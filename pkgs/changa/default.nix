{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "changa-${version}";
  version = "2017-10-15-213557";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-ExtraLight.ttf?raw=true";
      name = "Changa-ExtraLight.ttf";
      sha256 = "a1fb7f0c7e8e4ec2effe07bcdf8e231ad5a3ce8501929df77740c08d2905852a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-Light.ttf?raw=true";
      name = "Changa-Light.ttf";
      sha256 = "c1afd78df716e64b3ff34d43f0125df64868035c77a3ddeee9bdcc237f5135ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-Regular.ttf?raw=true";
      name = "Changa-Regular.ttf";
      sha256 = "405dc2c97868abced9f32e5a5b43dfccc52ce0d0b587518257d1955de6fe9dfa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-Medium.ttf?raw=true";
      name = "Changa-Medium.ttf";
      sha256 = "893248e51a1a9aa0f1e812d42ef529bd261fc13e69beab5a67b5fcc04b70e495";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-SemiBold.ttf?raw=true";
      name = "Changa-SemiBold.ttf";
      sha256 = "a3d6cb11dde951c6df0232f775686abf9e90ca5870518d6656ff3c267e5b901b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-Bold.ttf?raw=true";
      name = "Changa-Bold.ttf";
      sha256 = "b1acc31e91b1f28f6abf7b2ba0ee71257087d26ceb3386f31f260b8f02c76b20";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/changa/Changa-ExtraBold.ttf?raw=true";
      name = "Changa-ExtraBold.ttf";
      sha256 = "e1bea012926352770f726e3f6320960d8702c788b91873ba88284d32e9d6aae0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Changa-ExtraLight.ttf $out/share/fonts/truetype/Changa-ExtraLight.ttf
     install -Dm644 Changa-Light.ttf $out/share/fonts/truetype/Changa-Light.ttf
     install -Dm644 Changa-Regular.ttf $out/share/fonts/truetype/Changa-Regular.ttf
     install -Dm644 Changa-Medium.ttf $out/share/fonts/truetype/Changa-Medium.ttf
     install -Dm644 Changa-SemiBold.ttf $out/share/fonts/truetype/Changa-SemiBold.ttf
     install -Dm644 Changa-Bold.ttf $out/share/fonts/truetype/Changa-Bold.ttf
     install -Dm644 Changa-ExtraBold.ttf $out/share/fonts/truetype/Changa-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Changa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
