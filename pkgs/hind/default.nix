{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-${version}";
  version = "2017-05-16-005212";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ea6ba1619c6e7c658d1935090eae5a058f8a0b7/ofl/hind/Hind-Light.ttf?raw=true";
      name = "Hind-Light.ttf";
      sha256 = "c31b8b6073b14f89187586fb1fa38710d8adae3429ef41e1a398dacbfe839e51";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ea6ba1619c6e7c658d1935090eae5a058f8a0b7/ofl/hind/Hind-Regular.ttf?raw=true";
      name = "Hind-Regular.ttf";
      sha256 = "01de158022f53077b52303e46de3b0ab5fb245222a7ffe25a2a57fdd9e969162";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ea6ba1619c6e7c658d1935090eae5a058f8a0b7/ofl/hind/Hind-Medium.ttf?raw=true";
      name = "Hind-Medium.ttf";
      sha256 = "70f9c1158390d0c93a8bc24b35b4be4b2439653372bbce7381a32c686fb91a98";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d774fc0799fdeddbd8720616a6d2d791be29fafa/ofl/hind/Hind-SemiBold.ttf?raw=true";
      name = "Hind-SemiBold.ttf";
      sha256 = "1742a1b0aba97b49da1d3ee3af568fa997c59a3cfe73829f7bec293f416d25dd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8ea6ba1619c6e7c658d1935090eae5a058f8a0b7/ofl/hind/Hind-Bold.ttf?raw=true";
      name = "Hind-Bold.ttf";
      sha256 = "330c54396bc27628c32e69b88654e41065722182c6f33b936a2a46d72c9d6774";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hind-Light.ttf $out/share/fonts/truetype/Hind-Light.ttf
     install -Dm644 Hind-Regular.ttf $out/share/fonts/truetype/Hind-Regular.ttf
     install -Dm644 Hind-Medium.ttf $out/share/fonts/truetype/Hind-Medium.ttf
     install -Dm644 Hind-SemiBold.ttf $out/share/fonts/truetype/Hind-SemiBold.ttf
     install -Dm644 Hind-Bold.ttf $out/share/fonts/truetype/Hind-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Hind";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
