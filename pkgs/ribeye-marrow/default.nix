{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ribeye-marrow-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/ribeyemarrow/RibeyeMarrow-Regular.ttf?raw=true";
      name = "RibeyeMarrow-Regular.ttf";
      sha256 = "4b19d54b86a068bb5b8a060938d87d1e6028d566c8efb68fa9c7debaa19987d0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RibeyeMarrow-Regular.ttf $out/share/fonts/truetype/RibeyeMarrow-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Ribeye Marrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
