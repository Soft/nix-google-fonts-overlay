{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "unifrakturcook-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90abd17b4f97671435798b6147b698aa9087612f/ofl/unifrakturcook/UnifrakturCook-Bold.ttf?raw=true";
      name = "UnifrakturCook-Bold.ttf";
      sha256 = "ea002fa9c65f1a612af100e00d87ab65f16381f450020ec3d021f3dbf79a6dcd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 UnifrakturCook-Bold.ttf $out/share/fonts/truetype/UnifrakturCook-Bold.ttf
  '';

  meta = with stdenv.lib; {
    description = "UnifrakturCook";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
