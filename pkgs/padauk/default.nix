{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "padauk-${version}";
  version = "2017-10-15-213557";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/padauk/Padauk-Regular.ttf?raw=true";
      name = "Padauk-Regular.ttf";
      sha256 = "7165f738d046ef00f76c8cbd167da7b0f26496de122e2190cb5a5ccf1c0a7d42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c19f2d37a7466e9da7b64aca5413f0ad5d584c3b/ofl/padauk/Padauk-Bold.ttf?raw=true";
      name = "Padauk-Bold.ttf";
      sha256 = "b720d8c44a29db7fa0b92d6de1eab5563795cc6a74d0df146f7b985a4dd78452";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Padauk-Regular.ttf $out/share/fonts/truetype/Padauk-Regular.ttf
     install -Dm644 Padauk-Bold.ttf $out/share/fonts/truetype/Padauk-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "Padauk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
