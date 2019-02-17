{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "contrail-one-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/contrailone/ContrailOne-Regular.ttf?raw=true";
      name = "ContrailOne-Regular.ttf";
      sha256 = "a7665eddb068507736f593ca8eb9f547db8a8d61ea1cf03e072554aab5a0e8b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ContrailOne-Regular.ttf $out/share/fonts/truetype/ContrailOne-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Contrail One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
