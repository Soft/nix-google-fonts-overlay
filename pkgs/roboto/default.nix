{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-${version}";
  version = "2017-03-31-224148";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Thin.ttf?raw=true";
      name = "Roboto-Thin.ttf";
      sha256 = "3d91f7aa69cb7f7064035895c566ac5cb9b2084582d351af7267bb4e0fba60f5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-ThinItalic.ttf?raw=true";
      name = "Roboto-ThinItalic.ttf";
      sha256 = "f5e89a344894a60f0f98f1c0182ba51f5046e29dde3118820d39025445aeaae8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Light.ttf?raw=true";
      name = "Roboto-Light.ttf";
      sha256 = "a6d343d425bc38db90152fa06058b1c7391eca9264f334ef65c1ce175085c6f6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-LightItalic.ttf?raw=true";
      name = "Roboto-LightItalic.ttf";
      sha256 = "364a23e13c64937c3fcea3db778628b89379c893849bbade6e5bf83c5f605c6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Regular.ttf?raw=true";
      name = "Roboto-Regular.ttf";
      sha256 = "79e851404657dac2106b3d22ad256d47824a9a5765458edb72c9102a45816d95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Italic.ttf?raw=true";
      name = "Roboto-Italic.ttf";
      sha256 = "5fce8b6f8ba9f4d19f0d535e241d56a2b8e72bb07e7df711d968d092ef7f9fca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Medium.ttf?raw=true";
      name = "Roboto-Medium.ttf";
      sha256 = "f205cc511821ea56078a105557fcea6253129404d411c997e1866fbd006abb68";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-MediumItalic.ttf?raw=true";
      name = "Roboto-MediumItalic.ttf";
      sha256 = "f177eed10d2470d13ec68d04907a582829d0ee8281f8a02a906f6954c7816e58";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Bold.ttf?raw=true";
      name = "Roboto-Bold.ttf";
      sha256 = "7d0b991ee3e0be7af01ad7ea8cd2beea6c00a25e679a0226b6737f079aafff86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-BoldItalic.ttf?raw=true";
      name = "Roboto-BoldItalic.ttf";
      sha256 = "a4bcac14f419a97de0917198a4bc51c3ed4fc4a3db9f68a5102f23664ee01354";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Black.ttf?raw=true";
      name = "Roboto-Black.ttf";
      sha256 = "3872e9b39760a1b59ac1e192633dbb3b58e595b4d423930ac7ded525e9ae25e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-BlackItalic.ttf?raw=true";
      name = "Roboto-BlackItalic.ttf";
      sha256 = "013d22a4fb2638adba28555ee19366f4585f6dc533b7c332f4931a231497cb22";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Roboto-Thin.ttf $out/share/fonts/truetype/Roboto-Thin.ttf
     install -Dm644 Roboto-ThinItalic.ttf $out/share/fonts/truetype/Roboto-ThinItalic.ttf
     install -Dm644 Roboto-Light.ttf $out/share/fonts/truetype/Roboto-Light.ttf
     install -Dm644 Roboto-LightItalic.ttf $out/share/fonts/truetype/Roboto-LightItalic.ttf
     install -Dm644 Roboto-Regular.ttf $out/share/fonts/truetype/Roboto-Regular.ttf
     install -Dm644 Roboto-Italic.ttf $out/share/fonts/truetype/Roboto-Italic.ttf
     install -Dm644 Roboto-Medium.ttf $out/share/fonts/truetype/Roboto-Medium.ttf
     install -Dm644 Roboto-MediumItalic.ttf $out/share/fonts/truetype/Roboto-MediumItalic.ttf
     install -Dm644 Roboto-Bold.ttf $out/share/fonts/truetype/Roboto-Bold.ttf
     install -Dm644 Roboto-BoldItalic.ttf $out/share/fonts/truetype/Roboto-BoldItalic.ttf
     install -Dm644 Roboto-Black.ttf $out/share/fonts/truetype/Roboto-Black.ttf
     install -Dm644 Roboto-BlackItalic.ttf $out/share/fonts/truetype/Roboto-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Roboto";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
