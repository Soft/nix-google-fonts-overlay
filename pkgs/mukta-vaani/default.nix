{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mukta-vaani-${version}";
  version = "2017-08-30-200648";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-ExtraLight.ttf?raw=true";
      name = "MuktaVaani-ExtraLight.ttf";
      sha256 = "6107a72e51ccf4a747a264d21de81069a614005fca8f87273fbcb0f64d6d4413";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-Light.ttf?raw=true";
      name = "MuktaVaani-Light.ttf";
      sha256 = "a3585b04045ca3fdf642b147e032fb02b61d8a5372b7216b8c17d6eedb612017";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-Regular.ttf?raw=true";
      name = "MuktaVaani-Regular.ttf";
      sha256 = "296f0086902c79f422d9c4a9a03b6e42433a5e7b5e213e7e00f2d1c8fd4f266c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-Medium.ttf?raw=true";
      name = "MuktaVaani-Medium.ttf";
      sha256 = "5b19b8efcb0a042e7edeec14befaa3a653e27b48aae8db6c572346deae020990";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-SemiBold.ttf?raw=true";
      name = "MuktaVaani-SemiBold.ttf";
      sha256 = "7e86b220ccee01048cde6ac87824459475c578ba8494a83df3fade2111c9d75f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-Bold.ttf?raw=true";
      name = "MuktaVaani-Bold.ttf";
      sha256 = "e11f330d219010c13b85e3bc568366ba32544f1c4ae7f9c4976792ed2918ac51";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2055f72ef8b1962c57b15ca93d54aa361b62757c/ofl/muktavaani/MuktaVaani-ExtraBold.ttf?raw=true";
      name = "MuktaVaani-ExtraBold.ttf";
      sha256 = "427f6ca0b008914d4e0ca277fab7fd63d3c439863661f08e39f4fccc7e1a488d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MuktaVaani-ExtraLight.ttf $out/share/fonts/truetype/MuktaVaani-ExtraLight.ttf
     install -Dm644 MuktaVaani-Light.ttf $out/share/fonts/truetype/MuktaVaani-Light.ttf
     install -Dm644 MuktaVaani-Regular.ttf $out/share/fonts/truetype/MuktaVaani-Regular.ttf
     install -Dm644 MuktaVaani-Medium.ttf $out/share/fonts/truetype/MuktaVaani-Medium.ttf
     install -Dm644 MuktaVaani-SemiBold.ttf $out/share/fonts/truetype/MuktaVaani-SemiBold.ttf
     install -Dm644 MuktaVaani-Bold.ttf $out/share/fonts/truetype/MuktaVaani-Bold.ttf
     install -Dm644 MuktaVaani-ExtraBold.ttf $out/share/fonts/truetype/MuktaVaani-ExtraBold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Mukta Vaani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
