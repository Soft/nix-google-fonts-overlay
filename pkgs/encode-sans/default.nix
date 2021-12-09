{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-${version}";
  version = "2017-02-07-175141";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Thin.ttf?raw=true";
      name = "EncodeSans-Thin.ttf";
      sha256 = "b1ed6b5b451a8658cda52b69094e316e3235a1a89f0cb6f0ae9a8c34f3758395";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-ExtraLight.ttf?raw=true";
      name = "EncodeSans-ExtraLight.ttf";
      sha256 = "72c8c26e7ce01b4fa2c90cefaf814d7bd24c3454dc6eaae18f0bf8e188cb99c4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Light.ttf?raw=true";
      name = "EncodeSans-Light.ttf";
      sha256 = "fdc7c76af87bc9ded18a8d30c141761e779f8095193bde1543c39b7ec84021e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Regular.ttf?raw=true";
      name = "EncodeSans-Regular.ttf";
      sha256 = "49fd63fcba548c4d041cbb88537233a7084bcf4b73dd9e5d2352218d320c37ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Medium.ttf?raw=true";
      name = "EncodeSans-Medium.ttf";
      sha256 = "4179eaee67d0c29e0526d52834e6f16314c0f789791977a005918f1f7d5f9428";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-SemiBold.ttf?raw=true";
      name = "EncodeSans-SemiBold.ttf";
      sha256 = "78bc8cdd1f104c227abec228f20c28075e2eff73b47ddbf48ef888e415be0fcb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Bold.ttf?raw=true";
      name = "EncodeSans-Bold.ttf";
      sha256 = "1a4176d5f54a5481bbb415e6eea550f7c5e050ae22dde52a62102834296347cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-ExtraBold.ttf?raw=true";
      name = "EncodeSans-ExtraBold.ttf";
      sha256 = "18c7ff6cc50f00c9415928141519b50ed18942c25f4e168544e5262659468d2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bcfa02fe6a8d1380d768783d4bc2a52ddc184567/ofl/encodesans/EncodeSans-Black.ttf?raw=true";
      name = "EncodeSans-Black.ttf";
      sha256 = "1d23d651256bf9425f005d396282a223680d94dfc4d1bb98a4b6d8671f18e651";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EncodeSans-Thin.ttf $out/share/fonts/truetype/EncodeSans-Thin.ttf
     install -Dm644 EncodeSans-ExtraLight.ttf $out/share/fonts/truetype/EncodeSans-ExtraLight.ttf
     install -Dm644 EncodeSans-Light.ttf $out/share/fonts/truetype/EncodeSans-Light.ttf
     install -Dm644 EncodeSans-Regular.ttf $out/share/fonts/truetype/EncodeSans-Regular.ttf
     install -Dm644 EncodeSans-Medium.ttf $out/share/fonts/truetype/EncodeSans-Medium.ttf
     install -Dm644 EncodeSans-SemiBold.ttf $out/share/fonts/truetype/EncodeSans-SemiBold.ttf
     install -Dm644 EncodeSans-Bold.ttf $out/share/fonts/truetype/EncodeSans-Bold.ttf
     install -Dm644 EncodeSans-ExtraBold.ttf $out/share/fonts/truetype/EncodeSans-ExtraBold.ttf
     install -Dm644 EncodeSans-Black.ttf $out/share/fonts/truetype/EncodeSans-Black.ttf
  '';

  meta = with lib; {
    description = "Encode Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
