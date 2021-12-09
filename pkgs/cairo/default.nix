{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cairo-${version}";
  version = "2017-05-23-164549";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-ExtraLight.ttf?raw=true";
      name = "Cairo-ExtraLight.ttf";
      sha256 = "f37e69c6158d737f154de74664bb1317f37b6538183e4e666adf2a9247d54f0c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-Light.ttf?raw=true";
      name = "Cairo-Light.ttf";
      sha256 = "830a1489fb183980488959596e9c06cf695941f5d7997e470e39b18904d28fd3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-Regular.ttf?raw=true";
      name = "Cairo-Regular.ttf";
      sha256 = "0c9a1ff13c99af2225c665c15ce8f8628617aaebbf49a571442582e0ed4ea403";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-SemiBold.ttf?raw=true";
      name = "Cairo-SemiBold.ttf";
      sha256 = "86648bb71248d569b67e3a1a21b7a48cba7cd573268226310f6d818a2bce0a54";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-Bold.ttf?raw=true";
      name = "Cairo-Bold.ttf";
      sha256 = "1936f28abe143ff104b2320157195fbc333bbdc52acf927c1353dbaeaeee7c16";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e86936fd5b72936fe1eed526b69d49343a7d353b/ofl/cairo/Cairo-Black.ttf?raw=true";
      name = "Cairo-Black.ttf";
      sha256 = "d85059df68594b833ab5c2314f24d53595b134ddc600541d8e067337aa563b61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cairo-ExtraLight.ttf $out/share/fonts/truetype/Cairo-ExtraLight.ttf
     install -Dm644 Cairo-Light.ttf $out/share/fonts/truetype/Cairo-Light.ttf
     install -Dm644 Cairo-Regular.ttf $out/share/fonts/truetype/Cairo-Regular.ttf
     install -Dm644 Cairo-SemiBold.ttf $out/share/fonts/truetype/Cairo-SemiBold.ttf
     install -Dm644 Cairo-Bold.ttf $out/share/fonts/truetype/Cairo-Bold.ttf
     install -Dm644 Cairo-Black.ttf $out/share/fonts/truetype/Cairo-Black.ttf
  '';

  meta = with lib; {
    description = "Cairo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
