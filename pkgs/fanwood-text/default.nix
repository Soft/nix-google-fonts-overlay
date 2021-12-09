{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fanwood-text-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/fanwoodtext/FanwoodText-Regular.ttf?raw=true";
      name = "FanwoodText-Regular.ttf";
      sha256 = "98aa9cbf5c5ece368501d188b1565ae3e7f6c9970ee3823769b8e67219dc33c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/fanwoodtext/FanwoodText-Italic.ttf?raw=true";
      name = "FanwoodText-Italic.ttf";
      sha256 = "23f51e2fda243a8759d5c32ff8a94da23dc697e8c9a014d4718aa0ab7ed3c808";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FanwoodText-Regular.ttf $out/share/fonts/truetype/FanwoodText-Regular.ttf
     install -Dm644 FanwoodText-Italic.ttf $out/share/fonts/truetype/FanwoodText-Italic.ttf
  '';

  meta = with lib; {
    description = "Fanwood Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
