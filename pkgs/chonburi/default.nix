{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chonburi-${version}";
  version = "2016-01-11-164358";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f2bdc7d8394ddd713df33f9a2ef60dea7afe9bf4/ofl/chonburi/Chonburi-Regular.ttf?raw=true";
      name = "Chonburi-Regular.ttf";
      sha256 = "aa0dac4df08af10785ba1dc10121492227f8e4288f0a23d11dd1d1f5a7f6ebfa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chonburi-Regular.ttf $out/share/fonts/truetype/Chonburi-Regular.ttf
  '';

  meta = with stdenv.lib; {
    description = "Chonburi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
