{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiri-${version}";
  version = "2017-08-07-210849";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc2d9d776339a1c80907ed52be14ca9b38ee4636/ofl/amiri/Amiri-Regular.ttf?raw=true";
      name = "Amiri-Regular.ttf";
      sha256 = "bd185dcc872a9321d68b70525bd4fc45cc809c0410d307b8158c468a103825f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc2d9d776339a1c80907ed52be14ca9b38ee4636/ofl/amiri/Amiri-Italic.ttf?raw=true";
      name = "Amiri-Italic.ttf";
      sha256 = "005280aeb66a8727317299cafeeafe8baf5578beda9e36676c0f423a3203a22b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc2d9d776339a1c80907ed52be14ca9b38ee4636/ofl/amiri/Amiri-Bold.ttf?raw=true";
      name = "Amiri-Bold.ttf";
      sha256 = "c519a145f8de6715a39c6911cf12782d536458a43325c12f81d05116d479ef72";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fc2d9d776339a1c80907ed52be14ca9b38ee4636/ofl/amiri/Amiri-BoldItalic.ttf?raw=true";
      name = "Amiri-BoldItalic.ttf";
      sha256 = "0f21caa7ca55eef942a745c50e4812eb5c8b37a7227671fb4963756aed7372e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amiri-Regular.ttf $out/share/fonts/truetype/Amiri-Regular.ttf
     install -Dm644 Amiri-Italic.ttf $out/share/fonts/truetype/Amiri-Italic.ttf
     install -Dm644 Amiri-Bold.ttf $out/share/fonts/truetype/Amiri-Bold.ttf
     install -Dm644 Amiri-BoldItalic.ttf $out/share/fonts/truetype/Amiri-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Amiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
