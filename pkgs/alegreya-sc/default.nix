{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alegreya-sc-${version}";
  version = "2017-10-31-200519";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-Regular.ttf?raw=true";
      name = "AlegreyaSC-Regular.ttf";
      sha256 = "5c8fba800b848b851e308dfdfdc573b64135e498db41cbd0b6d78ba9d267d9a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-Italic.ttf?raw=true";
      name = "AlegreyaSC-Italic.ttf";
      sha256 = "1e89a8fd7ca396f5f7862be6d13c57fd28bb3b71f3294216b0b5fd5047ead9b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-Medium.ttf?raw=true";
      name = "AlegreyaSC-Medium.ttf";
      sha256 = "fa896222115cc9a41c0695a3ee6feafbaba97932e9bb6240520b3feeb560ea2c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-MediumItalic.ttf?raw=true";
      name = "AlegreyaSC-MediumItalic.ttf";
      sha256 = "7f75204ce88025fd42b6f55051d52ccb3218127bb652da976b61ad9d290a498d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-Bold.ttf?raw=true";
      name = "AlegreyaSC-Bold.ttf";
      sha256 = "3ef96cbf3be7b84d9dff9b1aa1e2ac40eec0cf323ccd0638395cdef9c5a91528";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-BoldItalic.ttf?raw=true";
      name = "AlegreyaSC-BoldItalic.ttf";
      sha256 = "f0d577301defcaeb5c4cf3d7afd88d878affd6749539e614b5d6d08a92c66e2a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-ExtraBold.ttf?raw=true";
      name = "AlegreyaSC-ExtraBold.ttf";
      sha256 = "d485e1fea222301f8600daa70be44027f39795127c9c5fb77a6bd9f5aba8dbf7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-ExtraBoldItalic.ttf?raw=true";
      name = "AlegreyaSC-ExtraBoldItalic.ttf";
      sha256 = "3d99eb98f65af4295c388b5ba67d606a0afd29e9c0fe756fc929bf4b17c73586";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-Black.ttf?raw=true";
      name = "AlegreyaSC-Black.ttf";
      sha256 = "0d5d9c8a36e9458f5598d1136d71387ae32a5ab94f06833eadc341555d0a4e91";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5ece6cbcec0d6ecb11d65c7d64d9eb3975f81a1b/ofl/alegreyasc/AlegreyaSC-BlackItalic.ttf?raw=true";
      name = "AlegreyaSC-BlackItalic.ttf";
      sha256 = "ea81582efc3f03411c83310b7c6af952690f50ad2e28af8b6c26b96e9d77bc07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlegreyaSC-Regular.ttf $out/share/fonts/truetype/AlegreyaSC-Regular.ttf
     install -Dm644 AlegreyaSC-Italic.ttf $out/share/fonts/truetype/AlegreyaSC-Italic.ttf
     install -Dm644 AlegreyaSC-Medium.ttf $out/share/fonts/truetype/AlegreyaSC-Medium.ttf
     install -Dm644 AlegreyaSC-MediumItalic.ttf $out/share/fonts/truetype/AlegreyaSC-MediumItalic.ttf
     install -Dm644 AlegreyaSC-Bold.ttf $out/share/fonts/truetype/AlegreyaSC-Bold.ttf
     install -Dm644 AlegreyaSC-BoldItalic.ttf $out/share/fonts/truetype/AlegreyaSC-BoldItalic.ttf
     install -Dm644 AlegreyaSC-ExtraBold.ttf $out/share/fonts/truetype/AlegreyaSC-ExtraBold.ttf
     install -Dm644 AlegreyaSC-ExtraBoldItalic.ttf $out/share/fonts/truetype/AlegreyaSC-ExtraBoldItalic.ttf
     install -Dm644 AlegreyaSC-Black.ttf $out/share/fonts/truetype/AlegreyaSC-Black.ttf
     install -Dm644 AlegreyaSC-BlackItalic.ttf $out/share/fonts/truetype/AlegreyaSC-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Alegreya SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
