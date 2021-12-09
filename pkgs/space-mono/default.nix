{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "space-mono-${version}";
  version = "2017-05-23-164451";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f88845ccf872c316f56420b3a9d00dd6f3057b31/ofl/spacemono/SpaceMono-Regular.ttf?raw=true";
      name = "SpaceMono-Regular.ttf";
      sha256 = "fa5802bba20311cca2673d3cdc1e89b34b7d44fe6f2d730bd6c5d4229199ae39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f88845ccf872c316f56420b3a9d00dd6f3057b31/ofl/spacemono/SpaceMono-Italic.ttf?raw=true";
      name = "SpaceMono-Italic.ttf";
      sha256 = "e383813db95fa1a86b8f2720dd6ac01a6533a9c8ea85ddf1c63d7f938cf81732";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f88845ccf872c316f56420b3a9d00dd6f3057b31/ofl/spacemono/SpaceMono-Bold.ttf?raw=true";
      name = "SpaceMono-Bold.ttf";
      sha256 = "90319b9d3ab87c0ab9c3af919e50dacf73521aba80732f1e7905be68608a42a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f88845ccf872c316f56420b3a9d00dd6f3057b31/ofl/spacemono/SpaceMono-BoldItalic.ttf?raw=true";
      name = "SpaceMono-BoldItalic.ttf";
      sha256 = "3e7c633dda1180bfba0dff9659a9883fae3a1ff5866148ddd633892a03bcb1a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpaceMono-Regular.ttf $out/share/fonts/truetype/SpaceMono-Regular.ttf
     install -Dm644 SpaceMono-Italic.ttf $out/share/fonts/truetype/SpaceMono-Italic.ttf
     install -Dm644 SpaceMono-Bold.ttf $out/share/fonts/truetype/SpaceMono-Bold.ttf
     install -Dm644 SpaceMono-BoldItalic.ttf $out/share/fonts/truetype/SpaceMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Space Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
