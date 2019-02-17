{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-${version}";
  version = "2016-01-12-204307";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc38515385021d838c296c6aa9d6342cee9e2047/ofl/notoserif/NotoSerif-Regular.ttf?raw=true";
      name = "NotoSerif-Regular.ttf";
      sha256 = "375e83eade60ffc1c2f516a89175358ba5fcb785a9bdb68c6a3be1b6470704dd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc38515385021d838c296c6aa9d6342cee9e2047/ofl/notoserif/NotoSerif-Italic.ttf?raw=true";
      name = "NotoSerif-Italic.ttf";
      sha256 = "4a5ae30931a7590be230ae1867650679f803188c5211493bd1a5e3fc0ac78181";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc38515385021d838c296c6aa9d6342cee9e2047/ofl/notoserif/NotoSerif-Bold.ttf?raw=true";
      name = "NotoSerif-Bold.ttf";
      sha256 = "58de10340959ee1abd715fb6f8a670f44ca3adfc5d9c7e09e48d7af4a1ff4192";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc38515385021d838c296c6aa9d6342cee9e2047/ofl/notoserif/NotoSerif-BoldItalic.ttf?raw=true";
      name = "NotoSerif-BoldItalic.ttf";
      sha256 = "c8d7e9e9a586cd5f671fc267906c8739be70fb5e92069fd891e1177e1d255fe1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerif-Regular.ttf $out/share/fonts/truetype/NotoSerif-Regular.ttf
     install -Dm644 NotoSerif-Italic.ttf $out/share/fonts/truetype/NotoSerif-Italic.ttf
     install -Dm644 NotoSerif-Bold.ttf $out/share/fonts/truetype/NotoSerif-Bold.ttf
     install -Dm644 NotoSerif-BoldItalic.ttf $out/share/fonts/truetype/NotoSerif-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Noto Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
