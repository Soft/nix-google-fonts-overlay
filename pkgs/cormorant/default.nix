{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-${version}";
  version = "2017-02-07-173914";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-Light.ttf?raw=true";
      name = "Cormorant-Light.ttf";
      sha256 = "007d53a57a9fb568c10195f6fb8a29dc0214d7ccb723232adbfd914b1edbb14b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-LightItalic.ttf?raw=true";
      name = "Cormorant-LightItalic.ttf";
      sha256 = "e67ca8e956d688f46361abe3033e7681a175c0dbc9a94db3afa58ac089bd303a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-Regular.ttf?raw=true";
      name = "Cormorant-Regular.ttf";
      sha256 = "ebb587db8619df066692617e3cd2cd1aae1d241df2c2065a74192da9f23f9e49";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-Italic.ttf?raw=true";
      name = "Cormorant-Italic.ttf";
      sha256 = "f36d6768db65f1ce24aa0bdcb4c5dec1d21795bb110f44ed50ba254e85963538";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-Medium.ttf?raw=true";
      name = "Cormorant-Medium.ttf";
      sha256 = "aadf9c483afe6de2300d3dc7e33392cd91a52585a7a08b3a42a51df63b3d07e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-MediumItalic.ttf?raw=true";
      name = "Cormorant-MediumItalic.ttf";
      sha256 = "5946f2a380956eea5f0232d4acadfbe42776a8d97f2fe31cf4464d2e82c4243d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-SemiBold.ttf?raw=true";
      name = "Cormorant-SemiBold.ttf";
      sha256 = "c489a4e44d57e3b4f05f25ac8e98d3ab0ab73371ac81e6594e17c264a3ca9095";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-SemiBoldItalic.ttf?raw=true";
      name = "Cormorant-SemiBoldItalic.ttf";
      sha256 = "a9529b0ed56363681c8a83992340f26848f24d42856be34edf07b4a789e810da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-Bold.ttf?raw=true";
      name = "Cormorant-Bold.ttf";
      sha256 = "4263a6069018c2cf729e38c04b7a703b4dcdc5fe87d5cb0671147d3bc92c9722";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5a736ab2db4f7e2e3e2710ce2331dd217bb07735/ofl/cormorant/Cormorant-BoldItalic.ttf?raw=true";
      name = "Cormorant-BoldItalic.ttf";
      sha256 = "61804946c225106deec7f399f80b0f6edeab098c2fc857e9e8754c4de1ad72af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cormorant-Light.ttf $out/share/fonts/truetype/Cormorant-Light.ttf
     install -Dm644 Cormorant-LightItalic.ttf $out/share/fonts/truetype/Cormorant-LightItalic.ttf
     install -Dm644 Cormorant-Regular.ttf $out/share/fonts/truetype/Cormorant-Regular.ttf
     install -Dm644 Cormorant-Italic.ttf $out/share/fonts/truetype/Cormorant-Italic.ttf
     install -Dm644 Cormorant-Medium.ttf $out/share/fonts/truetype/Cormorant-Medium.ttf
     install -Dm644 Cormorant-MediumItalic.ttf $out/share/fonts/truetype/Cormorant-MediumItalic.ttf
     install -Dm644 Cormorant-SemiBold.ttf $out/share/fonts/truetype/Cormorant-SemiBold.ttf
     install -Dm644 Cormorant-SemiBoldItalic.ttf $out/share/fonts/truetype/Cormorant-SemiBoldItalic.ttf
     install -Dm644 Cormorant-Bold.ttf $out/share/fonts/truetype/Cormorant-Bold.ttf
     install -Dm644 Cormorant-BoldItalic.ttf $out/share/fonts/truetype/Cormorant-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cormorant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
