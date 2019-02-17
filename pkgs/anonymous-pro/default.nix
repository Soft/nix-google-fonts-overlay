{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anonymous-pro-${version}";
  version = "2017-08-07-203109";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/152b05bd851962fe7fafd816566ac74f7ffd2cea/ofl/anonymouspro/AnonymousPro-Regular.ttf?raw=true";
      name = "AnonymousPro-Regular.ttf";
      sha256 = "46d8b9a5f4b38fc9d30f3cdd676d4c6f78a9bef949bb1a8304216cc731eb87f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/152b05bd851962fe7fafd816566ac74f7ffd2cea/ofl/anonymouspro/AnonymousPro-Italic.ttf?raw=true";
      name = "AnonymousPro-Italic.ttf";
      sha256 = "bc13ac34e9994128c61b54bf4e78a8adb439b543ea0b19761d159342599f441a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/152b05bd851962fe7fafd816566ac74f7ffd2cea/ofl/anonymouspro/AnonymousPro-Bold.ttf?raw=true";
      name = "AnonymousPro-Bold.ttf";
      sha256 = "52895657e7d48860089ebfac63a27244f37a2218ec9c5019a0b37fe885c0fc0c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/152b05bd851962fe7fafd816566ac74f7ffd2cea/ofl/anonymouspro/AnonymousPro-BoldItalic.ttf?raw=true";
      name = "AnonymousPro-BoldItalic.ttf";
      sha256 = "4e811e1e3b60fc763fb24acd27781e72241a8380beb0ffa5e07af2b87133496d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnonymousPro-Regular.ttf $out/share/fonts/truetype/AnonymousPro-Regular.ttf
     install -Dm644 AnonymousPro-Italic.ttf $out/share/fonts/truetype/AnonymousPro-Italic.ttf
     install -Dm644 AnonymousPro-Bold.ttf $out/share/fonts/truetype/AnonymousPro-Bold.ttf
     install -Dm644 AnonymousPro-BoldItalic.ttf $out/share/fonts/truetype/AnonymousPro-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Anonymous Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
