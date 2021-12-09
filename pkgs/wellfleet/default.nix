{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wellfleet-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/wellfleet/Wellfleet-Regular.ttf?raw=true";
      name = "Wellfleet-Regular.ttf";
      sha256 = "347f3918762c7b61c3b98d57071b03295485bc97b6bfb6c7627bcf365cc3c9e7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Wellfleet-Regular.ttf $out/share/fonts/truetype/Wellfleet-Regular.ttf
  '';

  meta = with lib; {
    description = "Wellfleet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
