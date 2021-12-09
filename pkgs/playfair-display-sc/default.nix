{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playfair-display-sc-${version}";
  version = "2017-11-03-142630";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Regular.ttf?raw=true";
      name = "PlayfairDisplaySC-Regular.ttf";
      sha256 = "55df09f0a49905a0f5e478597b5b3fc78acf0512ceb568504f3cdc4659662e47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Italic.ttf?raw=true";
      name = "PlayfairDisplaySC-Italic.ttf";
      sha256 = "9d9c78080ddb51db269056bd0d84e11007e6f6e1980ec15e757158afbb6f3ad4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Bold.ttf?raw=true";
      name = "PlayfairDisplaySC-Bold.ttf";
      sha256 = "b58a968cfc9b4e96e6857a206e1b042dc3fdbe5dc31cd75825d864f80ac7e915";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-BoldItalic.ttf?raw=true";
      name = "PlayfairDisplaySC-BoldItalic.ttf";
      sha256 = "3fe8dda7cb14eced6cd56fe2eb7eae8bee5d70caa301e75a23f1ce19fa6b82cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-Black.ttf?raw=true";
      name = "PlayfairDisplaySC-Black.ttf";
      sha256 = "9a508229401e2a5deb52ff9c11f00446a482bd25029836a54027716310cfe0b0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c0b8d90a7e6bd80588da02746085c903c8e2d242/ofl/playfairdisplaysc/PlayfairDisplaySC-BlackItalic.ttf?raw=true";
      name = "PlayfairDisplaySC-BlackItalic.ttf";
      sha256 = "6bea69bbdbbc93addd99bd124763e1fc8a31c9d72513e2d22087d04676e1546f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlayfairDisplaySC-Regular.ttf $out/share/fonts/truetype/PlayfairDisplaySC-Regular.ttf
     install -Dm644 PlayfairDisplaySC-Italic.ttf $out/share/fonts/truetype/PlayfairDisplaySC-Italic.ttf
     install -Dm644 PlayfairDisplaySC-Bold.ttf $out/share/fonts/truetype/PlayfairDisplaySC-Bold.ttf
     install -Dm644 PlayfairDisplaySC-BoldItalic.ttf $out/share/fonts/truetype/PlayfairDisplaySC-BoldItalic.ttf
     install -Dm644 PlayfairDisplaySC-Black.ttf $out/share/fonts/truetype/PlayfairDisplaySC-Black.ttf
     install -Dm644 PlayfairDisplaySC-BlackItalic.ttf $out/share/fonts/truetype/PlayfairDisplaySC-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Playfair Display SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
