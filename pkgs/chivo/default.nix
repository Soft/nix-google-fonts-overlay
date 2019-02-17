{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chivo-${version}";
  version = "2016-12-06-174608";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-Light.ttf?raw=true";
      name = "Chivo-Light.ttf";
      sha256 = "f3ff47c8223a58f42a316ad5cb368fd7f44011a58ec9e0e80d81bdbe47f8b827";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-LightItalic.ttf?raw=true";
      name = "Chivo-LightItalic.ttf";
      sha256 = "b0fefb75964c825e6e9cacdd62ffb7b78f617bfca84fd8fb377de9fcf51b4e59";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-Regular.ttf?raw=true";
      name = "Chivo-Regular.ttf";
      sha256 = "23305bb3a95e4ad5938bebd00ba1430fa5dda19a23e5d26dbe2a16748ae8b932";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-Italic.ttf?raw=true";
      name = "Chivo-Italic.ttf";
      sha256 = "05f175033b8c8573c97ad6d066051fcdae07a848fde73162f2129996df5f81ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-Bold.ttf?raw=true";
      name = "Chivo-Bold.ttf";
      sha256 = "7ac15464d714244640c7ce8aa27a4fa590ee8ee58bfa165fd07b2545f0f7f220";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-BoldItalic.ttf?raw=true";
      name = "Chivo-BoldItalic.ttf";
      sha256 = "6232373fa0d8097544714c165c1328abe789e79067926bd2f911237df8e5ad93";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-Black.ttf?raw=true";
      name = "Chivo-Black.ttf";
      sha256 = "36a4e8295178ec33b1269318705ba2d547363dcf7c8330ea3a4a8ac9536b310f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/829b5432f1a4b2ebd4ca638b371bc1c4f740aad6/ofl/chivo/Chivo-BlackItalic.ttf?raw=true";
      name = "Chivo-BlackItalic.ttf";
      sha256 = "87c24b4b363de8042e8a08f4890a2885882bc8f4d59e8a180f96ba43fb6e6b76";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chivo-Light.ttf $out/share/fonts/truetype/Chivo-Light.ttf
     install -Dm644 Chivo-LightItalic.ttf $out/share/fonts/truetype/Chivo-LightItalic.ttf
     install -Dm644 Chivo-Regular.ttf $out/share/fonts/truetype/Chivo-Regular.ttf
     install -Dm644 Chivo-Italic.ttf $out/share/fonts/truetype/Chivo-Italic.ttf
     install -Dm644 Chivo-Bold.ttf $out/share/fonts/truetype/Chivo-Bold.ttf
     install -Dm644 Chivo-BoldItalic.ttf $out/share/fonts/truetype/Chivo-BoldItalic.ttf
     install -Dm644 Chivo-Black.ttf $out/share/fonts/truetype/Chivo-Black.ttf
     install -Dm644 Chivo-BlackItalic.ttf $out/share/fonts/truetype/Chivo-BlackItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chivo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
