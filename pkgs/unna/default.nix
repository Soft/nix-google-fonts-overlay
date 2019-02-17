{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unna-${version}";
  version = "2016-12-06-185828";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/246377a59c3b8e935205441460c02f8c65a1ac0e/ofl/unna/Unna-Regular.ttf?raw=true";
      name = "Unna-Regular.ttf";
      sha256 = "94269efa448520c135ae1f994e0a711b214f5df4ce6b37f2d3ef10a7ccdb1700";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/246377a59c3b8e935205441460c02f8c65a1ac0e/ofl/unna/Unna-Italic.ttf?raw=true";
      name = "Unna-Italic.ttf";
      sha256 = "fd94aa77c2ab4572688ac8ad48c51629c8d651c32b23013b9c33cd72fc9c77b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/246377a59c3b8e935205441460c02f8c65a1ac0e/ofl/unna/Unna-Bold.ttf?raw=true";
      name = "Unna-Bold.ttf";
      sha256 = "d20dcc29cd2b5db18f6c782918f26ee9a6a8240a3850d7aa56fd9977024fc5b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/246377a59c3b8e935205441460c02f8c65a1ac0e/ofl/unna/Unna-BoldItalic.ttf?raw=true";
      name = "Unna-BoldItalic.ttf";
      sha256 = "3cf90fb9a8d12eb1cb909842633bf1468819deaf993d39988229d38200a7793e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Unna-Regular.ttf $out/share/fonts/truetype/Unna-Regular.ttf
     install -Dm644 Unna-Italic.ttf $out/share/fonts/truetype/Unna-Italic.ttf
     install -Dm644 Unna-Bold.ttf $out/share/fonts/truetype/Unna-Bold.ttf
     install -Dm644 Unna-BoldItalic.ttf $out/share/fonts/truetype/Unna-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Unna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
