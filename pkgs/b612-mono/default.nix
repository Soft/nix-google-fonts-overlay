{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "b612-mono-${version}";
  version = "2018-12-05-154950";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0655ae3b2ff9ff28fd1139363940bcfb9f596e39/ofl/b612mono/B612Mono-Regular.ttf?raw=true";
      name = "B612Mono-Regular.ttf";
      sha256 = "fee756b846b3449e64e0367cf0e525411e3693cfe561bfaecfddb04b531bd61c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0655ae3b2ff9ff28fd1139363940bcfb9f596e39/ofl/b612mono/B612Mono-Italic.ttf?raw=true";
      name = "B612Mono-Italic.ttf";
      sha256 = "59dd0d44ae7ad72f1bec4892156c0385d24d5606b0467a9eef7245a7b5d986af";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0655ae3b2ff9ff28fd1139363940bcfb9f596e39/ofl/b612mono/B612Mono-Bold.ttf?raw=true";
      name = "B612Mono-Bold.ttf";
      sha256 = "bac2ac09e69436505197e2aebe96e843e4b1281b7d406dfef01ed7037b6ba66d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0655ae3b2ff9ff28fd1139363940bcfb9f596e39/ofl/b612mono/B612Mono-BoldItalic.ttf?raw=true";
      name = "B612Mono-BoldItalic.ttf";
      sha256 = "586322e302fbdf2b2ef85f70d05b13370f53afe3e8ea90c536584ff2d786f444";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 B612Mono-Regular.ttf $out/share/fonts/truetype/B612Mono-Regular.ttf
     install -Dm644 B612Mono-Italic.ttf $out/share/fonts/truetype/B612Mono-Italic.ttf
     install -Dm644 B612Mono-Bold.ttf $out/share/fonts/truetype/B612Mono-Bold.ttf
     install -Dm644 B612Mono-BoldItalic.ttf $out/share/fonts/truetype/B612Mono-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "B612 Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
