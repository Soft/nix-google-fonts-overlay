{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nobile-${version}";
  version = "2017-10-15-213557";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-Regular.ttf?raw=true";
      name = "Nobile-Regular.ttf";
      sha256 = "fc2eab24ea3dbe7f5d80324fa5c5d3ea5098175755c3218e3d54cec4355987f2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-Italic.ttf?raw=true";
      name = "Nobile-Italic.ttf";
      sha256 = "21bc5dc61007c4478be3f541238c38637434b29abe39c800cedc6115c85e40a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-Medium.ttf?raw=true";
      name = "Nobile-Medium.ttf";
      sha256 = "0926ef055e7637dd23eeb1717a45b6eef4e5c5c1bd99a9516d2770e587ae4524";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-MediumItalic.ttf?raw=true";
      name = "Nobile-MediumItalic.ttf";
      sha256 = "ac8e7d909380ce15e49a2209f77ec55f13088f1c71b24a4ff1cc0340b88d48af";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-Bold.ttf?raw=true";
      name = "Nobile-Bold.ttf";
      sha256 = "d7c865eebef07f288fa2788528023537cb6a155fc89af352cb0b1441f7447558";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/nobile/Nobile-BoldItalic.ttf?raw=true";
      name = "Nobile-BoldItalic.ttf";
      sha256 = "ddfc58964740d28b33eac62edde3b5807ffaf3f18199ca30667988d3a15eccad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nobile-Regular.ttf $out/share/fonts/truetype/Nobile-Regular.ttf
     install -Dm644 Nobile-Italic.ttf $out/share/fonts/truetype/Nobile-Italic.ttf
     install -Dm644 Nobile-Medium.ttf $out/share/fonts/truetype/Nobile-Medium.ttf
     install -Dm644 Nobile-MediumItalic.ttf $out/share/fonts/truetype/Nobile-MediumItalic.ttf
     install -Dm644 Nobile-Bold.ttf $out/share/fonts/truetype/Nobile-Bold.ttf
     install -Dm644 Nobile-BoldItalic.ttf $out/share/fonts/truetype/Nobile-BoldItalic.ttf
  '';

  meta = with stdenv.lib; {
    description = "Nobile";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
