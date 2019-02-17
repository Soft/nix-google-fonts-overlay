{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "philosopher-${version}";
  version = "2017-01-17-073032";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04e90dca48cc6a4384ae8ba2dfbdd760910ea298/ofl/philosopher/Philosopher-Regular.ttf?raw=true";
      name = "Philosopher-Regular.ttf";
      sha256 = "e5b60b3448c0e57dc96e25b41e860abe280a66279ffb642048041121856b0974";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04e90dca48cc6a4384ae8ba2dfbdd760910ea298/ofl/philosopher/Philosopher-Italic.ttf?raw=true";
      name = "Philosopher-Italic.ttf";
      sha256 = "870dd32aef115bb4b98d2323765240295490f782a98356d3f1d144ccffaeac16";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04e90dca48cc6a4384ae8ba2dfbdd760910ea298/ofl/philosopher/Philosopher-Bold.ttf?raw=true";
      name = "Philosopher-Bold.ttf";
      sha256 = "e46667d7ef944d9d0a94c56aae44d93c01ca0949f7c347916072089b24420182";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04e90dca48cc6a4384ae8ba2dfbdd760910ea298/ofl/philosopher/Philosopher-BoldItalic.ttf?raw=true";
      name = "Philosopher-BoldItalic.ttf";
      sha256 = "b9e38f7c424ff127e8298eeb902b7b1ac069aad9b44b6d46f6235b0eae84b4f9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Philosopher-Regular.ttf $out/share/fonts/truetype/Philosopher-Regular.ttf
     install -Dm644 Philosopher-Italic.ttf $out/share/fonts/truetype/Philosopher-Italic.ttf
     install -Dm644 Philosopher-Bold.ttf $out/share/fonts/truetype/Philosopher-Bold.ttf
     install -Dm644 Philosopher-BoldItalic.ttf $out/share/fonts/truetype/Philosopher-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Philosopher";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
