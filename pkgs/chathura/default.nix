{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chathura-${version}";
  version = "2017-05-11-034715";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2b5d7409b1e72c0ec6259fbc4e1194c82a0b478/ofl/chathura/Chathura-Thin.ttf?raw=true";
      name = "Chathura-Thin.ttf";
      sha256 = "ffa6266426a6339d2dcb9ae7ccd0d06f5360e91c9a67db2597d70b0bd2e10aad";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2b5d7409b1e72c0ec6259fbc4e1194c82a0b478/ofl/chathura/Chathura-Light.ttf?raw=true";
      name = "Chathura-Light.ttf";
      sha256 = "a998baa580e25340e1a44a343c62a0f106f4763e7e0cf153f279fb6c965a122d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2b5d7409b1e72c0ec6259fbc4e1194c82a0b478/ofl/chathura/Chathura-Regular.ttf?raw=true";
      name = "Chathura-Regular.ttf";
      sha256 = "aff3aab23f202092d411dae54a612968dee39cf411c0d8049e6a9ea99f7e2c14";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2b5d7409b1e72c0ec6259fbc4e1194c82a0b478/ofl/chathura/Chathura-Bold.ttf?raw=true";
      name = "Chathura-Bold.ttf";
      sha256 = "0a493c95a74cc13f6766dbf2de4c47dda0c446c5fc0d6576b970d7890ce9f9aa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c2b5d7409b1e72c0ec6259fbc4e1194c82a0b478/ofl/chathura/Chathura-ExtraBold.ttf?raw=true";
      name = "Chathura-ExtraBold.ttf";
      sha256 = "8323a68a9b99940ce5009503503c0a75b739ac2e1e767e32c4b35b20b0a163fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chathura-Thin.ttf $out/share/fonts/truetype/Chathura-Thin.ttf
     install -Dm644 Chathura-Light.ttf $out/share/fonts/truetype/Chathura-Light.ttf
     install -Dm644 Chathura-Regular.ttf $out/share/fonts/truetype/Chathura-Regular.ttf
     install -Dm644 Chathura-Bold.ttf $out/share/fonts/truetype/Chathura-Bold.ttf
     install -Dm644 Chathura-ExtraBold.ttf $out/share/fonts/truetype/Chathura-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chathura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
