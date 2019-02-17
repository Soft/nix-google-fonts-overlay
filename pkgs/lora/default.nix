{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lora-${version}";
  version = "2017-12-19-110716";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/135381ca429c5261f7469a45c997bbd3a3a68d7d/ofl/lora/Lora-Regular.ttf?raw=true";
      name = "Lora-Regular.ttf";
      sha256 = "178a698904efd9f1e87b35f764d56cc2ee3654c0dc92ebd05f5ed7e208abdc84";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/135381ca429c5261f7469a45c997bbd3a3a68d7d/ofl/lora/Lora-Italic.ttf?raw=true";
      name = "Lora-Italic.ttf";
      sha256 = "195f109ee5e20a6df6789141ed582c8679ba0c84627a536017cf1bc7b8967661";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/135381ca429c5261f7469a45c997bbd3a3a68d7d/ofl/lora/Lora-Bold.ttf?raw=true";
      name = "Lora-Bold.ttf";
      sha256 = "6cc7ecf18af9e7e0e6d29bdc35dfd713b3e047fd6187ca2e7fcc8303ce8395b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/135381ca429c5261f7469a45c997bbd3a3a68d7d/ofl/lora/Lora-BoldItalic.ttf?raw=true";
      name = "Lora-BoldItalic.ttf";
      sha256 = "4960511a741c96cf6de98a1c0d2abef228d63999540bacfe811e22a5f4e5831a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lora-Regular.ttf $out/share/fonts/truetype/Lora-Regular.ttf
     install -Dm644 Lora-Italic.ttf $out/share/fonts/truetype/Lora-Italic.ttf
     install -Dm644 Lora-Bold.ttf $out/share/fonts/truetype/Lora-Bold.ttf
     install -Dm644 Lora-BoldItalic.ttf $out/share/fonts/truetype/Lora-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Lora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
