{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zilla-slab-highlight-${version}";
  version = "2017-08-29-155129";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cee1cb5db07a05c8692c2bcced9db412f07f46e1/ofl/zillaslabhighlight/ZillaSlabHighlight-Regular.ttf?raw=true";
      name = "ZillaSlabHighlight-Regular.ttf";
      sha256 = "2c9248dba34693c039b6e20cb34faa9ed385fe676ec8c7f364effbce37e35bc7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cee1cb5db07a05c8692c2bcced9db412f07f46e1/ofl/zillaslabhighlight/ZillaSlabHighlight-Bold.ttf?raw=true";
      name = "ZillaSlabHighlight-Bold.ttf";
      sha256 = "e6653c7e0299c1cae5e7fe21157267ade56dd301b36cda073c407299b82548f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZillaSlabHighlight-Regular.ttf $out/share/fonts/truetype/ZillaSlabHighlight-Regular.ttf
     install -Dm644 ZillaSlabHighlight-Bold.ttf $out/share/fonts/truetype/ZillaSlabHighlight-Bold.ttf
  '';

  meta = with lib; {
    description = "Zilla Slab Highlight";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
