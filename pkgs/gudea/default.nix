{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gudea-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gudea/Gudea-Regular.ttf?raw=true";
      name = "Gudea-Regular.ttf";
      sha256 = "a4b5410090a821ea17021627312babdf3d8db0271217fd8c4d9f629ef0a2d90b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gudea/Gudea-Italic.ttf?raw=true";
      name = "Gudea-Italic.ttf";
      sha256 = "d4e7abc76e5bf3686436938840927b3522fd704c1f920514b31b67993409e274";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/gudea/Gudea-Bold.ttf?raw=true";
      name = "Gudea-Bold.ttf";
      sha256 = "2b1b56763dd590f782b65b07978fbe6f9a83ba5ecfdaf698c0e942ca06181059";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gudea-Regular.ttf $out/share/fonts/truetype/Gudea-Regular.ttf
     install -Dm644 Gudea-Italic.ttf $out/share/fonts/truetype/Gudea-Italic.ttf
     install -Dm644 Gudea-Bold.ttf $out/share/fonts/truetype/Gudea-Bold.ttf
  '';

  meta = with lib; {
    description = "Gudea";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
