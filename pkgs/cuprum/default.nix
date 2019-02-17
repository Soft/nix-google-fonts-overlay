{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cuprum-${version}";
  version = "2017-01-17-072907";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e2b29bbf65aa2e840d8fe4283f376cfc9a5a589/ofl/cuprum/Cuprum-Regular.ttf?raw=true";
      name = "Cuprum-Regular.ttf";
      sha256 = "ec665ae9e39647943bcabb8ba69eba735c40ef7915e1712894e4654f2d3d4662";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e2b29bbf65aa2e840d8fe4283f376cfc9a5a589/ofl/cuprum/Cuprum-Italic.ttf?raw=true";
      name = "Cuprum-Italic.ttf";
      sha256 = "36d9c2dc1a56cdb3a8e4572a50484278dcf3a3cdfa558cb876c1dac5652d7045";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e2b29bbf65aa2e840d8fe4283f376cfc9a5a589/ofl/cuprum/Cuprum-Bold.ttf?raw=true";
      name = "Cuprum-Bold.ttf";
      sha256 = "fa50bfee0b19d2d8fbda08a7335b402aeddcc86da130e06854b2f4b41d726f9e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4e2b29bbf65aa2e840d8fe4283f376cfc9a5a589/ofl/cuprum/Cuprum-BoldItalic.ttf?raw=true";
      name = "Cuprum-BoldItalic.ttf";
      sha256 = "e2ede4a89cdcc8ecfd291a8ba191d8512407945298f8b1bdc92fe24cceda039d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cuprum-Regular.ttf $out/share/fonts/truetype/Cuprum-Regular.ttf
     install -Dm644 Cuprum-Italic.ttf $out/share/fonts/truetype/Cuprum-Italic.ttf
     install -Dm644 Cuprum-Bold.ttf $out/share/fonts/truetype/Cuprum-Bold.ttf
     install -Dm644 Cuprum-BoldItalic.ttf $out/share/fonts/truetype/Cuprum-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Cuprum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
